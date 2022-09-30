function [status,err]=isTrue(s_old,s_new,tlrn)
    mat=s_old-s_new;
    if max(abs(mat(:)))>tlrn
        err=max(abs(mat(:)));
        status=true;
    else
        status=false;
    end
end