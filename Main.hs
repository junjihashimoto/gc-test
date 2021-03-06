import Control.Monad
import Foreign.C.String
import Foreign.C.Types
import Foreign
import System.Mem
import System.IO
import System.IO.Unsafe (unsafePerformIO)
import Control.Concurrent


data Vector

foreign import ccall "test.h init_vector"
  c_init_vector  :: IO (Ptr Vector)

foreign import ccall unsafe "test.h &delete_vector"
  c_delete_vector  :: FunPtr( Ptr Vector -> IO () )

foreign import ccall unsafe "test.h size_vector"
  c_size  :: Ptr Vector -> IO CInt

newVector :: IO (ForeignPtr Vector)
newVector = do
  ptr <- c_init_vector
  newForeignPtr c_delete_vector ptr

main = do
  hSetBuffering stdout NoBuffering
  forM_ [1..10] $ \_ -> do
    forM_ [1..10] $ \_ -> do
      _ <- newVector
      return ()
    print "Do gc"
    performMajorGC
    performMajorGC
    print "Done gc"
