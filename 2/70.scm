(define tree (generate-huffman-tree
               '(("A" 2) ("NA" 16) ("BOOM" 1) ("SHA" 3) ("GET" 2) ("YIP" 9) ("JOB" 2) ("WAH" 1))))

(encode '("GET" "A" "JOB"
"SHA" "NA" "NA" "NA" "NA" "NA" "NA" "NA" "NA"
"GET" "A" "JOB"
"SHA" "NA" "NA" "NA" "NA" "NA" "NA" "NA" "NA"
"WAH" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP"
"SHA" "BOOM") tree)

; The encoding requires 84 bits. If we use a fixed-length code, we will need 3 bits per symbol for the 8-symblo alphabet. The song has 36 symbols in total. Thus encoding with the fixed-length code will require 108 bits.
