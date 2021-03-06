(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
         (bury-buffer "*compilation*")
         (winner-undo)
         (message "Build successful."))
        (t                                                                    
         (message "Compilation exited abnormally: %s" string))))

(setq compilation-finish-functions 'compile-autoclose) 

(provide 'setup-compile)
