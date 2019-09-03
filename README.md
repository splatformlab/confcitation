1. load the DBLP database https://github.com/kite1988/dblp-parser

2. generate the list of papers for a specific conference

   (1) run MySQL client;
   
   (2) run "source authorlist.sql" in the client, it will generate the paper list of each author
       
       authorlist.sql can be generated with the script generate-sqlscript.sh
       run "generate-sqlscript.sh authorlist authorlist.sql"
       
3. obtain the citation number for each author's paper list
   run "PaperCitation.sh src_file output_file 0"
