List? bubbleSort(List? lista) {
  var aux;
  if (lista == null) return null;

  int i = 0, N = lista.length, c = 1;
  while (c != N) {
    for (i = 0; i < N - c; i++) {
      if (lista[i] > lista[i + 1]) {
        aux = lista[i + 1];
        lista[i + 1] = lista[i];
        lista[i] = aux;
      }
    }
    c++;
  }

  return lista;
}

void main() {
  final values = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]; //Final pode ter seu valor modificado umqa única vez após atribuição
  values.shuffle();
  print(values.toString());
  print(bubbleSort(values));
}
