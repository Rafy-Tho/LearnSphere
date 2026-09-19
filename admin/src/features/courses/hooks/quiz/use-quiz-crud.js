import { useState } from 'react';
import { useQuestionActions } from './use-question-actions';
import { useOptionActions } from './use-option-actions';
import { toast } from '@/hooks/use-toast';

const DEFAULT_QUIZ = { question: '', explanation: '', position: '' };
const DEFAULT_OPTIONS = [
  { text: '', is_correct: false, position: 1 },
  { text: '', is_correct: false, position: 2 },
];

export function useQuizCrud() {
  const [modal, setModal] = useState(false);
  const [editing, setEditing] = useState(null);
  const [parentId, setParentId] = useState('');
  const [position, setPosition] = useState(1);
  const [quizForm, setQuizForm] = useState(DEFAULT_QUIZ);
  const [optionsForm, setOptionsForm] = useState(DEFAULT_OPTIONS);
  const [deletedOptionIds, setDeletedOptionIds] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const { createQuestion, updateQuestion, deleteQuestion } =
    useQuestionActions();
  const { createOption, updateOption, deleteOption } = useOptionActions();

  const openCreate = (lessonId, nextPosition = 1) => {
    setParentId(lessonId);
    setPosition(nextPosition);
    setEditing(null);
    setQuizForm(DEFAULT_QUIZ);
    setOptionsForm(DEFAULT_OPTIONS);
    setDeletedOptionIds([]);
    setModal(true);
  };

  const openEdit = (q) => {
    setParentId(q.lesson_id);
    setEditing(q);
    setQuizForm({ question: q.question, explanation: q.explanation || '' });
    const opts = [...(q.options ?? [])].sort((a, b) => a.position - b.position);
    setOptionsForm(
      opts.length > 0
        ? opts.map((o) => ({
            id: o.id,
            text: o.text,
            is_correct: o.is_correct,
            position: o.position,
          }))
        : DEFAULT_OPTIONS,
    );
    setDeletedOptionIds([]);
    setModal(true);
  };

  const save = async () => {
    if (!quizForm.question) return;
    setIsLoading(true);

    if (editing) {
      try {
        await updateQuestion({
          id: editing.id,
          data: {
            question: quizForm.question,
            explanation: quizForm.explanation,
            position: editing.position,
          },
        });

        await Promise.all(deletedOptionIds.map((id) => deleteOption(id)));

        await Promise.all(
          optionsForm
            .filter((o) => o.text.trim())
            .map((o, i) =>
              o.id
                ? updateOption({
                    id: o.id,
                    data: {
                      text: o.text,
                      isCorrect: o.is_correct,
                      position: o.position ?? i + 1,
                    },
                  })
                : createOption({
                    id: editing.id,
                    data: {
                      text: o.text,
                      isCorrect: o.is_correct,
                      position: o.position ?? i + 1,
                    },
                  }),
            ),
        );

        toast({
          title: 'Quiz updated successfully',
          description: 'The quiz has been updated successfully',
        });
      } catch (err) {
        toast({
          title: 'Failed to update quiz',
          description:
            err?.message || 'An error occurred while updating the quiz',
          variant: 'destructive',
        });
      } finally {
        setDeletedOptionIds([]);
        setIsLoading(false);
        setModal(false);
      }
    } else {
      try {
        const response = await createQuestion({
          id: parentId,
          data: {
            question: quizForm.question,
            explanation: quizForm.explanation,
            position,
          },
        });

        await Promise.all(
          optionsForm
            .filter((o) => o.text.trim())
            .map((o, i) =>
              createOption({
                id: response?.id,
                data: {
                  text: o.text,
                  isCorrect: o.is_correct,
                  position: i + 1,
                },
              }),
            ),
        );

        toast({
          title: 'Quiz created successfully',
          description: 'The quiz has been created successfully',
        });
      } catch (err) {
        toast({
          title: 'Failed to create quiz',
          description:
            err?.message || 'An error occurred while creating the quiz',
          variant: 'destructive',
        });
      } finally {
        setIsLoading(false);
        setModal(false);
      }
    }
  };

  const onQuizChange = (field, value) =>
    setQuizForm((f) => ({ ...f, [field]: value }));

  const onOptionChange = (i, field, value) =>
    setOptionsForm((f) =>
      f.map((o, idx) =>
        field === 'is_correct'
          ? { ...o, is_correct: idx === i ? value : false }
          : idx === i
            ? { ...o, [field]: value }
            : o,
      ),
    );

  const addOption = () =>
    setOptionsForm((f) => [
      ...f,
      { text: '', is_correct: false, position: f.length + 1 },
    ]);

  const removeOption = (i) => {
    const option = optionsForm[i];
    if (option?.id) {
      setDeletedOptionIds((prev) => [...prev, option.id]);
    }
    setOptionsForm((f) => f.filter((_, idx) => idx !== i));
  };

  const remove = async (id) => {
    try {
      await deleteQuestion(id);
      toast({
        title: 'Quiz deleted successfully',
        description: 'The quiz has been deleted successfully',
      });
    } catch (err) {
      toast({
        title: 'Failed to delete quiz',
        description:
          err?.message || 'An error occurred while deleting the quiz',
        variant: 'destructive',
      });
    }
  };

  return {
    modal,
    setModal,
    editing,
    quizForm,
    onQuizChange,
    optionsForm,
    onOptionChange,
    addOption,
    removeOption,
    openCreate,
    openEdit,
    save,
    remove,
    isLoading,
  };
}
