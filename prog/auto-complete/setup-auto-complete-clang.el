(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)
;; 添加c-mode和c++-mode的hook，开启auto-complete的clang扩展  
(defun wttr/ac-cc-mode-setup ()  
  ;; (make-local-variable 'ac-auto-start)  
  ;; (setq ac-auto-start nil)              ;auto complete using clang is CPU sensitive  
  (setq ac-sources (append '(ac-source-clang) ac-sources)))  
(add-hook 'c-mode-hook 'wttr/ac-cc-mode-setup)  
(add-hook 'c++-mode-hook 'wttr/ac-cc-mode-setup)  

;;You can find the /usr/XXX paths from the messages outputted by the command.
;; echo "" | g++ -v -x c++ -E -
(setq ac-clang-flags
      (mapcar(lambda (item)(concat "-I" item))
             (split-string
              "
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1/x86_64-unknown-linux-gnu
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1/backward
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include-fixed
 /usr/include
 /usr/include/SDL/SDL.h
 /usr/include/SDL/SDL_image.h
 /usr/include/SDL/SDL_ttf.h
 /usr/include/libfreenect
 /usr/include
")))

(provide 'setup-auto-complete-clang)
