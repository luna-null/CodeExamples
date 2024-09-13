$x = '12aba34ba5';
           @num = split /(a|b)+/, $x;    # @num = ('12','a','34','a','5')
           @num = split /(?:a|b)+/, $x;  # @num = ('12','34','5')

print "@num";
