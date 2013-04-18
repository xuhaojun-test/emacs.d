(require 'flymake)

(require 'setup-flymake)

;; (eval-after-load 'flymake '(require 'setup-flymake-clang))
(add-hook 'c++-mode-hook 'flymake-mode)

(require 'setup-flymake-tex)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(provide 'setup-all-flymake)
