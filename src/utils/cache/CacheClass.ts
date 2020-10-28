const storage = localStorage;

class CacheBase {
  protected key: string;

  constructor(key: string) {
    this.key = key;
  }

  set(value: any) {
    storage.setItem(this.key, value);
  }
  get() {
    return storage.getItem(this.key);
  }
  remove() {
    storage.removeItem(this.key);
  }
}

export class CacheStr extends CacheBase {
  constructor(key: string) {
    super(key);
  }
}

export class CacheArray extends CacheBase {
  constructor(key: string) {
    super(key);
  }

  set(value: any) {
    storage.setItem(this.key, JSON.stringify(value));
  }
  get() {
    return JSON.parse(storage.getItem(this.key) || '[]');
  }
}

export class CacheObject extends CacheBase {
  constructor(key: string) {
    super(key);
  }

  set(value: any) {
    storage.setItem(this.key, JSON.stringify(value));
  }
  get() {
    return JSON.parse(storage.getItem(this.key) || '{}');
  }
}
export class CacheInt extends CacheBase {
  constructor(key: string) {
    super(key);
  }

  // @ts-ignore
  get() {
    if (this.key) {
      // @ts-ignore
      const v = storage.getItem(this.key);
      const intValue = v === null ? undefined : +v;
      return intValue === intValue ? intValue : undefined;
    }
  }
}
