function parseQueryToObject(params) {
  const parsedQuery = {};

  for (const [key, value] of params.entries()) {
    const parsedValue = isNaN(value) ? value : Number(value);

    // Handle normal + array values (repeated keys become arrays)
    if (parsedQuery[key]) {
      if (Array.isArray(parsedQuery[key])) {
        parsedQuery[key].push(parsedValue);
      } else {
        parsedQuery[key] = [parsedQuery[key], parsedValue];
      }
    } else {
      parsedQuery[key] = parsedValue;
    }
  }

  return parsedQuery;
}

export default parseQueryToObject;
