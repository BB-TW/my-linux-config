Vim�UnDo� )�a�De�pK�E��7/��|W�o�]�   *   '    char file_name[] = "test_data.csv";   
                          _�.�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             _�%�    �                   5�_�                    /   %    ����                                                                                                                                                                                                                                                                                                                                                             _�%�     �   .   0   G      F        printf("插入的下标超出���序表的实际长度");5�_�                    G        ����                                                                                                                                                                                                                                                                                                                                                             _�&`     �   F               5�_�                    H       ����                                                                                                                                                                                                                                                                                                                                                             _�&k     �   H                �   H            5�_�                    I        ����                                                                                                                                                                                                                                                                                                                                                             _�&n     �   I   K   J    5�_�                            ����                                                                                                                                                                                                                                                                                                                                       K           V        _�-�     �              K   #include<stdio.h>   #include<stdlib.h>   #define LIST_INIT_SIZE 100   #define LISTNCREMENT 10   #define true 1   #define flase 0   #define OK 1   #define ERROR 0   #define INFASIBLE -1   #define OVERFLOW -2       typedef struct commodity{       int number;       unsigned int price;       char kind[10];   }com;       typedef int status;       typedef struct Comlist   {   	com* elem;   	int length;   	int listsize;       	}comlist;       	   status initlist(comlist* L)   {   6	L->elem = (com*)malloc(LIST_INIT_SIZE * sizeof(com));   	if (!L->elem)   	{   		return OVERFLOW;   	}   	L->length = 0;   	L->listsize = LIST_INIT_SIZE;   	return OK;   }           /*   顺序表的插入函数   */   0int insertList(comlist *L, int index, com val) {   L    if (index > L->length) { //存储的下表超出顺序表实际的长度   @        printf("插入的下标超出顺序表的实际长度");           return flase;       }   6    if (index < 0) //下标是负数，插入到结尾           index = L->length;   J    if (L->length == L->listsize) { //顺序表的存储单元已经存满   U        printf("顺序表的存储单元已满，继续分配新的存储单元。");   .        com* newBase = (com*) realloc(L->elem,   W                (L->listsize + LISTNCREMENT) * sizeof(com)); //继续分配存储单元           if (!newBase) {   /            printf("分配内存单元失败");               return flase;   	        }           L->elem = newBase;   $        L->listsize += LISTNCREMENT;       }   D    //寻找合适的插入位置，index后面的元素向后移动   -    for (int i = L->length; i > index; i--) {   3        L->elem[i] = L->elem[i - 1]; //向后移动       }   (    L->elem[index] = val; //插入元素       L->length++;       return true;   }       
int main()   {       }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _�.t     �                   5�_�      	              
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�     �   	      *      '    char file_name[] = "test_data.csv";5�_�      
           	   
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�     �   	      *      &    char file_name[] = "testdata.csv";5�_�   	              
   
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�     �   	      *      %    char file_name[] = "estdata.csv";5�_�   
                 
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�     �   	      *      $    char file_name[] = "stdata.csv";5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�    �   	      *      #    char file_name[] = "tdata.csv";5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                  V        _�.�     �   	      *      "    char file_name[] = "data.csv";5��