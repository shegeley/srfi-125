;;; SPDX-FileCopyrightText: 2015 William D Clinger <will@ccs.neu.edu>
;;;
;;; SPDX-License-Identifier: LicenseRef-Clinger

(define-library (srfi 125)

  (export

   make-hash-table
   hash-table
   hash-table-unfold
   alist->hash-table 

   hash-table?
   hash-table-contains?
   hash-table-empty?
   hash-table=?
   hash-table-mutable? 

   hash-table-ref
   hash-table-ref/default 

   hash-table-set!
   hash-table-delete!
   hash-table-intern!
   hash-table-update!
   hash-table-update!/default
   hash-table-pop!
   hash-table-clear! 

   hash-table-size
   hash-table-keys
   hash-table-values
   hash-table-entries
   hash-table-find
   hash-table-count

   hash-table-map
   hash-table-for-each
   hash-table-map!
   hash-table-map->list
   hash-table-fold
   hash-table-prune!

   hash-table-copy
   hash-table-empty-copy
   hash-table->alist 

   hash-table-union!
   hash-table-intersection!
   hash-table-difference!
   hash-table-xor!

   ;; The following procedures are deprecated by SRFI 125:

   (rename
    (deprecated:hash                            hash)
    (deprecated:string-hash                     string-hash)
    (deprecated:string-ci-hash                  string-ci-hash)
    (deprecated:hash-by-identity                hash-by-identity)
    (deprecated:string-ci-hash                  string-ci-hash)
    (deprecated:hash-by-identity                hash-by-identity)
    (deprecated:hash-table-equivalence-function hash-table-equivalence-function)
    (deprecated:hash-table-hash-function        hash-table-hash-function)
    (deprecated:hash-table-exists?              hash-table-exists?)
    (deprecated:hash-table-walk                 hash-table-walk)
    (deprecated:hash-table-merge!               hash-table-merge!)))

  (import (scheme base)
          (scheme write) ; for warnings about deprecated features
          (srfi 126)
          (except (srfi 128)
                  hash-salt      ; exported by (srfi 126)
                  string-hash    ; exported by (srfi 126)
                  string-ci-hash ; exported by (srfi 126)
                  symbol-hash    ; exported by (srfi 126)
                  ))

  (cond-expand
   ((library (scheme char))
    (import (scheme char)))
   (else
    (begin (define string-ci=? string=?))))

  (include "125.body.scm")

  ) ; eof
