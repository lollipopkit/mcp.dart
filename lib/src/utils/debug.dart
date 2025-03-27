const isDebug = bool.fromEnvironment('dart.vm.product') == false;

void dprint(Object? obj) {
  if (isDebug) {
    print(obj);
  }
}
