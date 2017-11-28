# ,rf - start r session
# ,l — send current line
# ,fd — send function on current line (and body below) to R
# ,se — send current selection (and echo)
# ,pe — send current paragraph (and echo)

# alternatively, use Rscript hello_world.r

x <- 5+5
sayHello <- function(){
   print('hello')
}

sayHello()
