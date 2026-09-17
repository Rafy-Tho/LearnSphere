function parseQueryToObject(params) {
  const result = {};

  for (const [key, value] of params.entries()) {
    const parsedValue = isNaN(value) ? value : Number(value);

    // Handle normal + array values (repeated keys become arrays)
    if (result[key]) {
      if (Array.isArray(result[key])) {
        result[key].push(parsedValue);
      } else {
        result[key] = [result[key], parsedValue];
      }
    } else {
      result[key] = parsedValue;
    }
  }

  return result;
}

export default parseQueryToObject;
