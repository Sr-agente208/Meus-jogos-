/* Persistence is kept separate from gameplay so future chapters can extend it safely. */
window.SaveManager = (() => {
  const KEY = 'algorthomus-echo-azul-save';
  const VERSION = 1;
  function load() {
    try {
      const save = JSON.parse(localStorage.getItem(KEY));
      return save && save.version === VERSION ? save : null;
    } catch { return null; }
  }
  function save(state) {
    const record = { version: VERSION, savedAt: new Date().toISOString(), ...state };
    localStorage.setItem(KEY, JSON.stringify(record));
    return record;
  }
  function clear() { localStorage.removeItem(KEY); }
  return { load, save, clear };
})();
