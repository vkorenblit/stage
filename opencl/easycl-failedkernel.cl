kernel void doStuff(int N, global int *out, global const int *in) {
   int globalId = get_global_id(0);
   if(globalId < N) {
       int value = in[globalId];
       out[globalId] = value;
   }
}

