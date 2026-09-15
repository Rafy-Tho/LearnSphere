function parseQueryToObject(params) {
  const parsedQuery = {};

  for (const [key, value] of params.entries()) {
    const parsedValue = isNaN(value) ? value : Number(value);

    if (key.includes("[")) {
      // Handle operators (e.g., duration[gte])
      const field = key.split("[")[0];
      const operator = key.match(/\[(.*)\]/)[1];

      if (!parsedQuery[field]) parsedQuery[field] = {};
      parsedQuery[field][operator] = parsedValue;
    } else {
      // Handle normal + array values
      if (parsedQuery[key]) {
        // If already exists → convert to array
        if (Array.isArray(parsedQuery[key])) {
          parsedQuery[key].push(parsedValue);
        } else {
          parsedQuery[key] = [parsedQuery[key], parsedValue];
        }
      } else {
        parsedQuery[key] = parsedValue;
      }
    }
  }

  return parsedQuery;
}

export default parseQueryToObject;
