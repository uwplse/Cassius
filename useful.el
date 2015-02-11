;; Some utilities for working with Cassius in Emacs

(defun hi-lock-region-symbols (a b buf)
  "Read a list of symbols from the active region and highlight them in a given buffer"
  (interactive "r\nbBuffer to highlight: ")
  (let ((symbols (read (buffer-substring a b))))
    (with-current-buffer buf
      (hi-lock-mode t)
      (hi-lock-mode)
      (dolist (symbol symbols)
        (hi-lock-line-face-buffer (symbol-name symbol) 'hi-yellow)))))
