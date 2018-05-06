" Vim syntax file
" Language:     N1QL - Couchbase Server Query Language 
" Maintainer:   Me
" URL:          https://github.com/guyhoozdis/vim-n1ql
"
" Couchbase Server v5.0 
" TODO: I don't want to have to go through the whole language spec by hand and
" type each keyword.  I'm hoping to scrape the published documentation.  I
" left some javascript hints to show how I pulled some of the text out.  The
" functions are going to be a pain b/c they span sevral pages and the text
" needs to be parsed / cleaned before it can be used here.


if exists("b:current_syntax")
  finish
endif


syn case ignore

" == Reserved Words
"
" https://developer.couchbase.com/documentation/server/5.0/n1ql/n1ql-language-reference/literals.html
"
"   var table = document.getElementsByClassName('tbody')
"   table[0].textContent
" 
syn keyword n1qlKeyword     ALL ALTER ANALYZE AND ANY ARRAY 
syn keyword n1qlKeyword     AS ASC BEGIN BETWEEN BINARY BOOLEAN 
syn keyword n1qlKeyword     BREAK BUCKET BUILD BY CALL CASE 
syn keyword n1qlKeyword     CAST CLUSTER COLLATE COLLECTION COMMIT CONNECT 
syn keyword n1qlKeyword     CONTINUE CORRELATE COVER CREATE DATABASE DATASET 
syn keyword n1qlKeyword     DATASTORE DECLARE DECREMENT DELETE DERIVED DESC 
syn keyword n1qlKeyword     DESCRIBE DISTINCT DO DROP EACH ELEMENT 
syn keyword n1qlKeyword     ELSE END EVERY EXCEPT EXCLUDE EXECUTE 
syn keyword n1qlKeyword     EXISTS EXPLAIN FALSE FETCH FIRST FLATTEN 
syn keyword n1qlKeyword     FOR FORCE FROM FUNCTION GRANT GROUP 
syn keyword n1qlKeyword     GSI HAVING IF IGNORE ILIKE IN 
syn keyword n1qlKeyword     INCLUDE INCREMENT INDEX INFER INLINE INNER 
syn keyword n1qlKeyword     INSERT INTERSECT INTO IS JOIN KEY 
syn keyword n1qlKeyword     KEYS KEYSPACE KNOWN LAST LEFT LET 
syn keyword n1qlKeyword     LETTING LIKE LIMIT LSM MAP MAPPING 
syn keyword n1qlKeyword     MATCHED MATERIALIZED MERGE MINUS MISSING NAMESPACE 
syn keyword n1qlKeyword     NEST NOT NULL NUMBER OBJECT OFFSET 
syn keyword n1qlKeyword     ON OPTION OR ORDER OUTER OVER 
syn keyword n1qlKeyword     PARSE PARTITION PASSWORD PATH POOL PREPARE 
syn keyword n1qlKeyword     PRIMARY PRIVATE PRIVILEGE PROCEDURE PUBLIC RAW 
syn keyword n1qlKeyword     REALM REDUCE RENAME RETURN RETURNING REVOKE 
syn keyword n1qlKeyword     RIGHT ROLE ROLLBACK SATISFIES SCHEMA SELECT 
syn keyword n1qlKeyword     SELF SEMI SET SHOW SOME START 
syn keyword n1qlKeyword     STATISTICS STRING SYSTEM THEN TO TRANSACTION 
syn keyword n1qlKeyword     TRIGGER TRUE TRUNCATE UNDER UNION UNIQUE 
syn keyword n1qlKeyword     UNKNOWN UNNEST UNSET UPDATE UPSERT USE 
syn keyword n1qlKeyword     USER USING VALIDATE VALUE VALUED VALUES 
syn keyword n1qlKeyword     VIA VIEW WHEN WHERE WHILE WITH 
syn keyword n1qlKeyword     WITHIN WORK XOR 


" == Datatypes
"
" https://developer.couchbase.com/documentation/server/5.0/n1ql/n1ql-language-reference/datatypes.html
" 
"   var datatypes = document.getElementsByClassName('sectiontitle');
"   var datatype_keywords = "";
"   for(var i=0; i < datatypes.length; i++) {
"     datatype_keywords += datatypes[i].textContent + "\n";
"   }
" 
syn keyword n1qlType    ARRAYS BINARY BOOLEAN COLLATION DATE
syn keyword n1qlType    MISSING NULL NUMBERS OBJECTS STRING 


" == Functions
"
" https://developer.couchbase.com/documentation/server/5.0/n1ql/n1ql-language-reference/functions.html
" 
"   var functions = document.getElementsByClassName('reader');
"   var function_keywords = "\n";
"   for (var i=0; i < functions.length; i++) {
"     var funcname = functions[i].text;
"     var idx = funcname.indexOf('(');
"     if (idx != -1) { funcname = funcname.slice(0, idx) }
"       function_keywords += funcname + '\n';
"   }
"
syn keyword n1qlOperator    ARRAY_AGG AVG COUNT MAX MIN SUM 
syn keyword n1qlOperator    ARRAY_LENGTH



" == Strings
" 
syn region n1qlString       start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region n1qlString       start=+'+  skip=+\\\\\|\\'+  end=+'+

" == Numbrers
"
syn match n1qlNumber        "-\=\<\d*\.\=[0-9_]\>"


" == Comments
"
syn region n1qlComment      start="/\*"  end="\*/" contains=n1qlTODO
syn match n1qlComment       "--.*$" contains=n1qlTODO
syn sync ccomment           n1qlComment


" == Developer Notes
"
syn keyword n1qlTODO contained TODO FIXME XXX DEBUG NOTE


" == Highlighting
"
hi def link n1qlComment    Comment
hi def link n1qlKeyword    Macro
hi def link n1qlOperator   Function
hi def link n1qlString     String
hi def link n1qlTODO       Todo
hi def link n1qlType       Type



let b:current_syntax = "n1ql"
