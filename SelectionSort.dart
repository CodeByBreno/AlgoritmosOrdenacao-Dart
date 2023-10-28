List? selectionSort(List? lista){
  if (lista == null) return null;

  var min, aux;
  int i, min_index, start = 0, N = lista.length;
  while(start != N){
    min_index = start;
    
    for(i = start; i < N; i++){
      if (i == start) min = lista[i];
      else 
        if (lista[i] < min) {
          min = lista[i];
          min_index = i;
        }
    }

  //Coloca o mínimo no início, e o valor dessa posição no local onde estava o mínimo
  aux = lista[start];
  lista[start] = min;
  lista[min_index] = aux;
  start++;
  }

  return lista;
}

void main(){
  final lista = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
  lista.shuffle();
  print("Lista Bagunçada = " + lista.toString());
  print("Lista Ordenada = " + selectionSort(lista).toString());
}