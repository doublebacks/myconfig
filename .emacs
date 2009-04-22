;; Set up the keyboard so the delete key on both the regular keyboard and the
;; keypad delete the character under the cursor and to the right under X,
;; instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install))
  ;; use extended compound-text coding for X clipboard
  ;;(set-selection-coding-system 'compound-text-with-extensions))

(setq emacs-file-path "~/.emacs_file/")
(setq load-path (cons (concat emacs-file-path "my-site-lisp") load-path))

(fset 'yes-or-no-p 'y-or-n-p)

;;(set-default-font "Consolas-10")
;;(set-fontset-font "fontset-default"
;;                  'gb18030 '("Microsoft YaHei" . "unicode-bmp"))

(set-default-font "Consolas:pixelsize=13")
(set-fontset-font (frame-parameter nil 'font)
		  'han (font-spec :family "Microsoft YaHei" :size 13))
(set-fontset-font (frame-parameter nil 'font)
		  'symbol (font-spec :family "Microsoft YaHei" :size 13))
(set-fontset-font (frame-parameter nil 'font)
		  'cjk-misc (font-spec :family "Microsoft YaHei" :size 13))
(set-fontset-font (frame-parameter nil 'font)
		  'bopomofo (font-spec :family "Microsoft YaHei" :size 13))


;; set backup options
(setq auto-backup-files nil)
(setq kept-old-versions 1)
(setq kept-new-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.emacs_file/tmp/")))
(setq backup-by-copying t)

;; don't display the welcome message
(setq inhibit-startup-message t)

;; display column and line number in the mode line
(setq column-number-mode t)

;; turn on font-lock mode
(global-font-lock-mode t)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; `kill-line' with no arg at beg of line kills the whole line
(setq-default kill-whole-line t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; don't bell warning
(setq visible-bell t)

;; yank at the cursor use mouse-2
(setq mouse-yank-at-point t)

;; keep the cursor on the end when move through the line end
(setq track-eol t)

;; menu and toolbar visible setting
;(menu-bar-mode nil) 
(tool-bar-mode nil)
;(scroll-bar-mode nil)

;; some screen setting
(setq default-fill-column 80)
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;; use text-mode replace the default fundamental-mode
(setq default-major-mode 'text-mode)

;; show parentheses matching, not jumping
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; mouse avoidance when cursor meeting it
;(mouse-avoidance-mode 'animate)

;; display image
(auto-image-file-mode)

;; active these default inhibit functions
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(setq frame-title-format '(buffer-file-name "Emacs - %f" "Emacs - %b"))

;; set my name and email address
(setq user-full-name "Zhang Yi")
(setq user-mail-address "zhangyi75@gmail.com")

;; set indent mode
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(add-hook 'c-mode-hook
		  '(lambda ()
			 (c-set-style "stroustrup")
			 (c-toggle-auto-state)
			 (c-toggle-hungry-state)))
(add-hook 'c++-mode-hook
		  '(lambda ()
			 (c-set-style "stroustrup")
			 (c-toggle-auto-state)
			 (c-toggle-hungry-state)))


;; set my key bindings, updating...
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [C-f4] 'revert-buffer)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-O" 'other-frame)
(global-set-key "\M-0" 'delete-window)
(global-set-key "\M-1" 'delete-other-windows)
(global-set-key "\M-2" 'split-window-vertically)
(global-set-key "\M-3" 'split-window-horizontally)
(global-set-key (kbd "C-x f") 'find-file-at-point)
;; use "C-)" to disable/enable line wrap
(global-set-key (kbd "C-)") 'toggle-truncate-lines)
;; define a keyboard macro, copy current line, include the '\n'
;(fset 'copy-current-line
;   "\C-x\C-n\C-a\C-@\C-n\C-a\367\C-p")
(fset 'copy-current-line
   [C-S-backspace ?\C-y])
(global-set-key (kbd "C-c y") 'copy-current-line)
(global-set-key [C-f6] 'calendar)
(global-set-key [C-S-f6] 'diary)
(global-set-key [M-f6] 'shell)
(global-set-key [f12] 'ibuffer)
(global-set-key [C-f12] 'bs-show)
(global-set-key (kbd "M-p") 'bs-cycle-previous)
(global-set-key (kbd "M-n") 'bs-cycle-next)



;; use recentf mode, now it's in the standard emacs distribution
(require 'recentf)
(recentf-mode 1)

;; use session package
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; use ibuffer, replace the default 'C-x C-b' action
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; tabbar setting
(global-set-key [(control prior)] 'previous-buffer)
(global-set-key [(control next)] 'next-buffer)

;; ido setting
(require 'ido)
(ido-mode t)

;; Enable directory deleting and coping in dired mode
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; dired-single: open directories in only one buffer
(require 'dired-x) ;; Required by other dired extensions
(require 'dired-single)
(define-key dired-mode-map (kbd "RET") 'joc-dired-single-buffer)
(define-key dired-mode-map (kbd "^")
  '(lambda () (interactive) (joc-dired-single-buffer "..")))

;; Rename files by just editing the dired buffer
(require 'wdired)
(autoload 'wdired-change-to-wdired-mode "wdired")
(define-key dired-mode-map (kbd "M-r") 'wdired-change-to-wdired-mode)

;; dired-sort: sort files in dired buffer
(require 'dired-sort-menu)
(setq dired-sort-menu-saved-config
  (quote ((dired-actual-switches . "-al")
          (ls-lisp-ignore-case . t)
          (ls-lisp-dirs-first . t))))
(define-key dired-mode-map [S-down-mouse-3] 'dired-sort-menu-popup)

;; Use cperl mode replace default perl mode
(fset 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)

;; Set verilog mode, load verilog-mode or vlog-mode
(setq verilog-extension 'vlog)
(cond 
 ((eq verilog-extension 'verilog)
  ;; Load verilog-mode
  (autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
  (setq auto-mode-alist (cons	 '("\\.v\\'" . verilog-mode) auto-mode-alist))
  (setq auto-mode-alist (cons	 '("\\.hv\\'" . verilog-mode) auto-mode-alist))
  ;; Change some default setting
  (setq verilog-indent-level                4
        verilog-indent-level-module         4
        verilog-indent-level-declaration    4
        verilog-indent-level-behavioral     4
        verilog-indent-level-directive      4
        verilog-case-indent			        4
        verilog-cexp-indent			        4
        verilog-auto-newline			    t
        verilog-auto-indent-on-newline      t
        verilog-tab-always-indent		    nil
        verilog-auto-endcomments		    nil
        verilog-minimum-comment-distance    40
        verilog-indent-begin-after-if	    t
        verilog-auto-lineup			        '(declaration)))
 ((eq verilog-extension 'vlog)
  ;; Load vlog-mode
  (setq load-path (cons (concat emacs-file-path "vlog-mode-20061019") load-path))
  (autoload 'vlog-mode "vlog-mode" "Vlog mode" t)
  (setq auto-mode-alist (cons	 '("\\.v\\'" . vlog-mode) auto-mode-alist))
  (setq auto-mode-alist (cons	 '("\\.hv\\'" . vlog-mode) auto-mode-alist))
  ;; Change some default setting
  (require 'vlog-mode)
  (setq vlog-indent-level-beh                   4
        vlog-indent-level-block			        0
        vlog-indent-level-block-beh		        0
        vlog-indent-level-block-inside	        4
        vlog-indent-level-case-inside           4
        vlog-indent-level-case-branch-inside    4
        vlog-indent-level-cond			        4
        vlog-indent-level-default			    4
      	vlog-indent-level-port-list		        4
	  	vlog-indent-align-port-list-to-paren    nil
	  	vlog-indent-align-else-to-if		    nil
      	vlog-mode-highlight-all-uppercase-words t
      	vlog-align-do-align-for-port-list       t
      	vlog-align-do-align-for-assign          nil
      	vlog-mode-double-comma-prefix           " "
      	vlog-mode-double-comma-suffix           " "
      	vlog-skel-default-clock                 "clk"
      	vlog-skel-default-reset                 "if (!rst_b)"
      	vlog-skel-user-name                     "ZhangYi"
      	vlog-skel-company-name                  "<COMPANY>"
        vlog-process-siglist-function           'vlog-siglist-processor-iorw
      	vlog-align-declaration-stop-list        '(12 20 32 34 48))
  (vlog-mode-enable-v2k)))


;; Set Python mode
(setq python-indent 4)

;; use a reduced color-theme, I selected some themes I like
(setq load-path (cons (concat emacs-file-path "color-theme") load-path))
(require 'color-theme)
(color-theme-initialize)
;(color-theme-classic)
;(color-theme-comidia)
;(color-theme-deep-blue)
;(color-theme-gnome2)
;(color-theme-rotor)
;(color-theme-snow)
;(color-theme-honeydew2)
;(color-theme-oceandeep2)
(color-theme-blackboard)

;; use cua.el to change the key-binding to windows habit
;; use the cua-rect can enter rectangle mode by "shifter-ENTER"
(require 'cua-base)
(cua-mode t)
(require 'cua-rect)

;; use bar-cursor mode, convert the block cursor into a bar cursor. In
;; overwrite mode, the bar cursor changes back into a block cursor
(require 'bar-cursor)
(bar-cursor-mode 1)

;; use table package, it's a WYGIWYS table editor
(require 'table)
(add-hook 'text-mode-hook 'table-recognize)

;; use hippie expand function, bind it in "C-TAB"
;(autoload 'senator-try-expand-semantic "senator")
;;(global-set-key [(control tab)] 'hippie-expand)
(global-set-key (kbd "C-;") 'hippie-expand)
(setq hippie-expand-try-functions-list
        '(;senator-try-expand-semantic
          python-try-complete
          try-expand-dabbrev
          try-expand-dabbrev-visible
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-file-name-partially
          try-complete-file-name
          try-expand-all-abbrevs
          try-expand-list
          try-expand-line
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol))

;; highlight current line
;;(global-hl-line-mode t)

;; display line number
;;(global-linum-mode t)

;; display time in the mode line
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time)

;; Isearch equivalents for * and # in Vim
(defun easymacs-vi-star-hash (forward)
  (if mark-active
  (progn
    (isearch-mode forward nil nil nil nil)
    (isearch-yank-string (buffer-substring (region-beginning)
                                               (region-end)))
    (deactivate-mark))
    (progn
  (isearch-mode forward nil nil nil t)
  (isearch-yank-string (current-word))))
  (isearch-search-and-update))

(defun easymacs-vi-star ()
  (interactive)
  (easymacs-vi-star-hash t))

(defun easymacs-vi-hash ()
  (interactive)
  (easymacs-vi-star-hash nil))

(defun easymacs-vi-star-sensitive ()
  (interactive)
  (let ((case-fold-search))
    (easymacs-vi-star-hash t)))
    
(defun easymacs-vi-hash-sensitive ()
  (interactive)
  (let ((case-fold-search))
    (easymacs-vi-star-hash nil)))
    
;; F3 Search operations
(global-set-key (kbd "<f3>")     'easymacs-vi-star)
(global-set-key (kbd "<S-f3>")   'easymacs-vi-hash)
(global-set-key (kbd "<M-f3>")   'replace-regexp)
(global-set-key (kbd "<M-S-f3>") 'query-replace-regexp)
(global-set-key (kbd "<C-f3>")   'occur)

;; See also copy-from-above-command in misc.el
(defun easymacs-copy-char-above (&optional b)
  "Copy a character exactly below/above the point
	to the current point of the cursor (default is above)."
  (interactive "p")
  (let (p col s)
    (setq p (point))
    (setq col (current-column))
    (forward-line (if b -1 1))
    (move-to-column col)
    (setq s (buffer-substring (point) (+ (point) 1)))
    (goto-char p)
    (insert s)))

(defun easymacs-copy-char-below ()
  (interactive)
  (easymacs-copy-char-above nil))

(global-set-key (kbd "<C-f5>")   'easymacs-copy-char-above)
(global-set-key (kbd "<S-C-f5>") 'easymacs-copy-char-below)

;; Mark and copy the word under the cursor, bind to "C-c w"
(defun select-current-word ()
  "select the word under the cursor"
  (interactive)
  (forward-char 1)
  (condition-case nil
      (backward-sexp 1) (error ""))
  (when (looking-at "[^a-zA-Z0-9_-]")
    (skip-chars-forward "'\"`*"))
  (condition-case nil
      (mark-sexp) (error ""))
  (kill-new (buffer-substring (mark) (point))))
(global-set-key (kbd "C-c w") 'select-current-word)

;; Mark some thing according to the char under the cursor, maybe a word,
;; a long word or the region between parens.
(defun mark-some-thing-at-point()
  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start )
                            end 
                       start)))
    (if (eq last-command 'mark-some-thing-at-point)
        (progn 
          ;; exchange mark and point
          (goto-char (mark-marker))
          (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))
(define-key global-map (kbd "<f5>") 'mark-some-thing-at-point)

;; When press '%', Go to the matching paren if on a paren; otherwise insert %.
(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; Emulation of vim command 'f'
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
	Typing `my-go-to-char-key' again will move forwad to the next Nth
	occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c f") 'my-go-to-char)

;; eshell setting
;; Map [f6] to eshell
(global-set-key [f6] 'eshell)
;; When enter [Home], don't go to line start
(add-hook 'eshell-mode-hook
		  (lambda ()
			(local-set-key [home] 'eshell-backward-argument)))
;; When use following command, start ansi-term
(add-hook
  'eshell-first-time-mode-hook
  (lambda ()
	(setq
	  eshell-visual-commands
	  (append
		'("mutt" "vim" "screen" "lftp" "ipython" "telnet")
		eshell-visual-commands))))

;; Set calendar
;; Set latitude and longitude of Shanghai, then you can get
;; sunrise and sunset time of Shanghai by press 'S' in Calendar.
(setq calendar-latitude +31.41)
(setq calendar-longitude +121.29)
(setq calendar-location-name "Shanghai")
;; I dont need these holidays
(setq christian-holidays nil)
(setq hebrew-holidays  nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
;; Week start day is monday
(setq calendar-week-start-day 1)

;; Set diary and appointment
(setq mark-diary-entries-in-calendar t)
(setq mark-holidays-in-calendar t)
(setq diary-mail-addr "zhangyi75@gmail.com")
(setq diary-file (concat emacs-file-path "diary/diary"))
(add-hook 'diary-hook 'appt-make-list)
;; Enable appointment issue message
;(setq appt-issue-message t)
(setq appt-display-format 'echo)
(setq appt-display-duration 60)

;; Set todo file location
(setq todo-file-do (concat emacs-file-path "todo/do"))
(setq todo-file-done (concat emacs-file-path "todo/done"))
(setq todo-file-top (concat emacs-file-path "todo/top"))

;; Let 'shell' display correct color
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(desktop-save-mode t)

;; Set color-moccur, for hyper search
(require 'color-moccur)

;; Set recent-jump, jump back to where you start a big jump
(require 'recent-jump)
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 20)
(global-set-key (kbd "C-=") 'recent-jump-jump-backward)
(global-set-key (kbd "C-+") 'recent-jump-jump-forward)
(require 'recent-jump)

(add-hook 'speedbar-before-popup-hook
          (lambda ()
            (interactive)
            (mapcar 'speedbar-add-supported-extension
                    (list ".v" ".vl" ".vh" ".vlib"
                          ".txt" ".hex"))))

;; Set global,a source code tag system.
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
          '(lambda ()
             (gtags-mode 1)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (gtags-mode 1)))

(defun run-current-file ()
  "Execute or compile the current file."
  (interactive)
  (let (ext-map file-name file-ext prog-name cmd-str)
; get the file name
; get the program name
; run it
    (setq ext-map
          '(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("sh" . "bash")
            ("java" . "javac")
            )
          )
    (setq file-name (buffer-file-name))
    (setq file-ext (file-name-extension file-name))
    (setq prog-name (cdr (assoc file-ext ext-map)))
    (setq cmd-str (concat prog-name " " file-name))
    (shell-command cmd-str)))

(global-set-key (kbd "<f7>") 'run-current-file)

;; MS Visual Studio style mark setting and jumping.
(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(global-set-key (kbd "<C-S-f2>") 'bm-remove-all)
;;(setq-default bm-buffer-persistence t)

;; Org-mode settings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/study.org"
                             "~/org/home.org"))

(server-start)

