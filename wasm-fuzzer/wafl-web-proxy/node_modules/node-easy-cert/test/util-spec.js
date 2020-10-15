'use strict'

const Util = require('../dist/util.js');

describe('Test Utils', () => {
  beforeAll(() => {
    jasmine.DEFAULT_TIMEOUT_INTERVAL = 20000;
  });

  describe('Test isIpDomain function', () => {
    it('should return false for "www.test.net" ', () => {
      expect(Util.isIpDomain('www.test.net')).toBe(false);
    });

    it('should return true for "127.0.0.1" ', () => {
      expect(Util.isIpDomain('127.0.0.1')).toBe(true);
    });
  });
});
