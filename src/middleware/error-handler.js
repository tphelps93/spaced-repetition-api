const { NODE_ENV } = require('../config');

module.exports = function errorHandler(error, req, res, next) {
  const response = { error: 'Server error' };
  console.error(error);

  res.status(500).json(response);
};
