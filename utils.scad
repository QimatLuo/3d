module kube(a,r,center=true)
{
    arg = is_list(a)
        ? [a[0]+r*2,a[1]+r*2,a[2]+r*2]
        : a+r*2
    ;
    
    cube(arg,center=center);
}

module mink(r=1)
{
    minkowski()
    {
        children(0);
        sphere(r);
    }
}