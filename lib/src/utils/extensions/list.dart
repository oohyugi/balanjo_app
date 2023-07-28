extension ListX<E> on List {
  E loop(int index) => this[index % length];
}