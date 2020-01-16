   Dim o As Integer
   Dim Size As Integer


     '' get an open file number.
     o = FreeFile
     
     '' open file for read-only access.    
     Open command(1) For Binary Access Read As #o
      
      '' make a buffer in memory thats the entire size of the file
      Dim As UByte file_char( LOF( o ) - 1 )

        '' get the file into the buffer.      
        Get #o, , file_char()

     Size = LOF (o)
      
     Close

     For ub As Integer = 1 to Size step 16
      Print " .db ";
      For ln As Integer = 1 to 16
       If ub+ln-2 < Size Then
        Print "$";
        Print Hex (file_char(ub+ln-2),2);
        If (ln<>16) and (ub+ln-1)<>Size Then
         print ", ";
        Else print
        Endif
       Endif
       Next ln
     Next ub
