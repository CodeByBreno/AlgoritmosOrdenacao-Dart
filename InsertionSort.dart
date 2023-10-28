List insertionSort(List entrada){
  int i = 0, j = 0, N = entrada.length;
  var aux;

  for (i = 0; i < N; i++){
    aux = entrada[i];

    for (j = i - 1; (j >= 0) && (entrada[j] >= aux); j--){ 
      // Vou recuando na lista enquanto os valores forem maiores que o aux. A cada passo,
      // avanço o valor comparado em uma unidade. Quando ele for menor que o aux, significa
      // que essa é posição onde o aux deve ficar. Como estou trocando o anterior pelo posterior 
      // de posição, então o valor de aux já está na posição correta e eu preciso simplesmente
      // sair do loop
      interchange(entrada, j, j + 1); 
    }
  }
  return entrada;
}

void interchange(List entrada, int i, int j){
  var aux;
  aux = entrada[i];
  entrada[i] = entrada[j];
  entrada[j] = aux;
}

void main(){
  final teste = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  teste.shuffle();
  print("Antes de Ordenar : " + teste.toString());
  print("Depois de Ordenar : " + insertionSort(teste).toString());
}