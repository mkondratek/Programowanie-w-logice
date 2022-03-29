process(Input, OutputA, OutputB) :- process(Input, OutputA), process(Input, OutputB), process(Input, OutputA, OutputB).

process(Input, Output) :- \+ at_end_of_stream(Input), get_char(Input, X), open(Output, append, OutputStream), put_char(OutputStream, X), close(OutputStream).

split2(Filename, FileNameA, FileNameB) :- open(Filename, read, Input), write(FileNameA), process(Input, FileNameA, FileNameB), close(Input).


process2(InputA, InputB, FileName) :- process2(InputA, FileName), process2(InputB, FileName), process2(InputA, InputB, FileName).

process2(Input, FileName) :- \+ at_end_of_stream(Input), get_char(Input, X), open(FileName, append, Output), put_char(Output, X), close(Output).

join2(FileNameA, FileNameB, FileName) :- open(FileNameA, read, InputA), open(FileNameB, read, InputB), process2(InputA, InputB, FileName), close(InputA), close(InputB).
