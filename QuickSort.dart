/*
- Pseudo-Código para o QuickSort

1. Escolhe um Elemento Pivô (vamos considerar o primeiro da lista)

2. Reeordenar a lista, com base nos seguintes critérios:
    a. O pivô estará na posição correta
    b. Todos os elementos antes do pivô serão menores que ele
    c. Todos os elementos depois do pivô serão maiores que ele

3. Repetir o mesmo procedimento para ordenar a parte da lista antes do pivô e após o pivô


*/

List? quickSort(List? entrada){
  if (entrada == null) return null;
  quickSortCore(entrada, 0, entrada.length-1);
  return entrada;
}

void quickSortCore(List entrada, int start, int end){
  int? q;
  if (start >= end){
    return;
  } else{
    q = partition(entrada, start, end);
    quickSortCore(entrada, start, q-1);
    quickSortCore(entrada, q+1, end);
  }
}

int partition(List entrada, int start, int end){
  var pivot = entrada[start];
  int i = start, j = end;
  while(i <= j){
    // Varre a lista de modo crescente enquanto não encontrar um elemento maior que o pivot (ou superar o valor de j)
    // Note que não é preciso verificar se i < entrada.length, pois isso já é limitado pelo ' j '

    while ((i <= j) && (entrada[i] <= pivot)) i++; // todas as posições antes de ' i ' tem valor menor que o pivot
    while ((i <= j) && (entrada[j] >= pivot)) j--; // todas as posições depois de ' j ' tem valor maior que o pivot

    if (i < j){ // Se os indíces não se superaram, então troco o valor maior (antes do pivot) pelo menor (após o pivot)
      interchange(entrada, i, j);
    }
  }

  // Esse ciclo acaba quando i supera j (ou vice-versa). Com isso, podemos garantir que tudo antes de 'i' é menor que o pivot
  // e tudo após o ' j ' é maior que o pivot. Logo, a posição correta para o pivot é ' j ' (ou i - 1, pense sobre isso)
  // Como o pivot estava na primeira posição da lista, devemos trocar o conteúdo nessa posição pelo conteúdo em 'j'
  interchange(entrada, start, j);
  return j; // Retorna o ponto de partição
}

void interchange(List entrada, int i, int j){
  var aux;
  aux = entrada[i];
  entrada[i] = entrada[j];
  entrada[j] = aux;
}

void main(){
  final teste = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
  teste.shuffle();
  print("Antes de Ordenar : " + teste.toString());
  print("Após Ordenar : " + quickSort(teste).toString());
}

void testPartition(){
  final teste = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
  teste.shuffle();
  print("Antes de Ordenar : " + teste.toString());
  var q = partition(teste, 0, teste.length - 1);
  print(teste[q].toString() + " [$q]");
  print("Após Ordenar : " + teste.toString());
}