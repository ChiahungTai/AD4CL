
__kernel void AD(__global struct gradient_structure* gs,
        __global struct entry* gradient_stack,
        __global struct variable* a,
        __global struct variable*b,
        __global double *x,
        __global double *y,
        __global struct variable *out, int size) {


    //initialize the gradient structure
    ad_init(gs, gradient_stack);

    //get global id
    int id = get_global_id(0);


    
     if (id < size) {
        struct variable aa = *a;
        struct variable bb = *b;
        double xx = x[id];
        double yy = y[id];
        struct variable temp = ad_minus_vd(gs, ad_plus(gs, ad_times_vd(gs, aa, xx), bb), yy);
        out[id]=ad_times(gs, temp, temp);
    }
    

  
}
