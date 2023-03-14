# Generic wrapper

def my_wrapper(func):
    def wrapper(*args, **kwargs):
        # do something before the function is called
        result = func(*args, **kwargs)
        # do something after the function is called
        return result
    return wrapper

@my_wrapper
def my_function():
    # function code here


#To create  a new function that calls an existing Python function

# To create a wrapper factory function

def wrapper_factory(func):
    def wrapper(*args, **kwargs):
        # Add any additional code you want to run before the function call
        result = func(*args, **kwargs)
        # Add any additional code you want to run after the function call
        return result
    return wrapper

#You can use this wrapper factory function to create a new wrapper for any function by passing that function as an argument 
# to wrapper_factory. For example, if you have a function called my_func that you want to wrap, you can create a new wrapper # function like this

def my_func(x):
    return x * 2

wrapped_func = wrapper_factory(my_func)


# You can customize the additional code that runs before and after the function call by modifying the wrapper function. 
# For example, you might want to log some information before and after the function call, or perform some error handling.

# To apply for any Seurat functions

seurat_wrapper_factory <- function(func) {
  wrapper <- function(...) {
    # Add any additional code you want to run before the function call
    result <- func(...)
    # Add any additional code you want to run after the function call
    return(result)
  }
  return(wrapper)
}

# For example, if you have a function called FindMarkers that you want to wrap, you can create a new wrapper function

FindMarkers_wrapper <- seurat_wrapper_factory(FindMarkers)

# here's an example of a wrapper factory function in Python that can be used to create wrappers for converting h5ad files to 
# h5 files using the anndata library

import anndata

def h5ad_to_h5_wrapper_factory(func):
    def wrapper(*args, **kwargs):
        # Add any additional code you want to run before the function call
        adata = anndata.read_h5ad(args[0])
        new_filename = args[0].replace('.h5ad', '.h5')
        adata.write_h5ad(new_filename)
        # Add any additional code you want to run after the function call
        return new_filename
    return wrapper

# This function takes in another function func as an argument and returns a new function wrapper that wraps around func. 
# The wrapper function takes in any number of positional arguments (*args) and keyword arguments (**kwargs) and passes them 
# on to func when it is called. Inside the wrapper function, we use the anndata library to read in the h5ad file specified 
# in the first positional argument. 
# We then use the write_h5ad method of the AnnData object to write out a new h5 file with the same data. 
# Finally, we return the name of the new h5 file.