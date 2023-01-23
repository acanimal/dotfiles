;;; init.el --- My custom Emacs configuration file
;;; Commentary:
;;   My custom Emacs configuration file
;;

;;; Code:

;; ----------------------------------------------------------------------------
;; Set some basic configuration options

(tool-bar-mode -1) ;; Hide some components
(menu-bar-mode -1)
(tab-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t) ;; Hide welcome screen
(setq make-backup-files nil) ;; Disabel creation of backup files

;; (desktop-save-mode t) ;; Save desktop session (frame, windows, etc)

(global-hl-line-mode t) ;; Show line cursor
(blink-cursor-mode 0) ;; Blink cursor forever
(line-number-mode t) ;; Show line modeline
(column-number-mode t) ;; Show column in modeline
(global-display-line-numbers-mode t) ;; Always show line numbers

(setq-default indent-tabs-mode nil) ;; Do not indent with tabs
(setq-default tab-width 2) ;; Set tab width
(setq tab-always-indent 'complete) ;; TAB tries to indent and if already indented then try to complete

;; Oter visual options for GUI macosx
(when (and (equal system-type 'darwin) (display-graphic-p))
  ;; We can change keys on GUI macosx
  ;; (setq mac-command-modifier 'meta)
  ;; (setq mac-option-modifier 'super)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)) ;; Make title bar more "native" look
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  ;; We can change the fonts here
  (when (member "Cascadia Code" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Cascadia Code-14"))
    (add-to-list 'default-frame-alist '(font . "Cascadia Code-14"))))

;; ----------------------------------------------------------------------------
;; Set package repositories and configure use-package
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; Configure use-package
;; Unless packages are not available locally, dont refresh package archives
;;(unless package-archive-contents
;;  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)

;; ----------------------------------------------------------------------------
;; Use only for benchmark purposes
;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; ----------------------------------------------------------------------------
;; dashboard
;; Set of beautifil themes to useful
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5))))

;; ----------------------------------------------------------------------------
;; doom themes and modeline
;; A set of beautifil themes to useful
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "Default")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
;;
;; doom-modeline
;; A nice modeline
(use-package doom-modeline
	:hook (after-init . doom-modeline-mode))
;;
;; solaire-mode help us distinguis real from unreal bufers
(use-package solaire-mode
	:init (solaire-global-mode))

;; ----------------------------------------------------------------------------
;; which-key
;; Displays available keybindings for a given prefix in echo area
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
	(setq which-key-idle-delay 0.7)
	(dimmer-configure-which-key))

;; ----------------------------------------------------------------------------
;; helpful
;; better emaacs documentation
(use-package helpful
  :init
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command)
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variabLe-function #'helpful-variable))

;; ----------------------------------------------------------------------------
;; dimmer
;; Highligh the selected buffer and obscure the rest
(use-package dimmer
  :init (dimmer-mode t)
  :config (setq dimmer-fraction 0.3))

;; ----------------------------------------------------------------------------
;; Ivy, counsel and swiper
;; Utility to show commands as a list and auto autocomplaetion  when you are
;; writing a command in the minibuffer
(use-package counsel
  :demand
  :init (ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")
	(global-set-key "\C-s" 'swiper)
	(global-set-key (kbd "C-c C-r") 'ivy-resume)
	(global-set-key (kbd "<f6>") 'ivy-resume)
	(global-set-key (kbd "M-x") 'counsel-M-x)
	(global-set-key (kbd "C-x C-f") 'counsel-find-file)
	(global-set-key (kbd "<f1> f") 'counsel-describe-function)
	(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	(global-set-key (kbd "<f1> o") 'counsel-describe-symbol))
;;
;; ivy-prescient to show most used options first
(use-package ivy-prescient
	:config (setq ivy-prescient-retain-classic-highlighting t)
	:init (ivy-prescient-mode))
;;
;; ivy-rich show extra info in lists
(use-package ivy-rich
	:init (ivy-rich-mode)
	:config (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

;; ----------------------------------------------------------------------------
;; company
;; Autocompleting code
(use-package company
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 2))

;; ----------------------------------------------------------------------------
;; Projectile
;; Utility to work with projects
(use-package projectile
  :init (projectile-mode)
  :bind (:map projectile-mode-map
							("C-c p" . projectile-command-map)))

;; ----------------------------------------------------------------------------
;; treemacs
;; The tree layout file explorer
;;
;; Within the treemacs window use:
;; - P to preview (peek) files and directories without open them
;; - ? to show help commands
(use-package treemacs
	:config
	(setq
	 treemacs-follow-after-init t
	 treemacs-is-never-other-window t
   treemacs-sorting 'alphabetic-case-insensitive-asc)
  (treemacs-resize-icons 12)
  :bind
    (:map global-map
      ("C-c t t" . treemacs)
      ("C-c t s" . treemacs-select-window)
			("C-c t w" . treemacs-edit-workspaces)))

;; Integrate treemacs and projectile
(use-package treemacs-projectile
  :after (treemacs projectile))

;; Install all-the-icons package and integrate with treemacs
(use-package all-the-icons
	:if (display-graphic-p))
(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons))
(use-package treemacs-icons-dired
  :after (treemacs all-the-icons)
  :init (treemacs-icons-dired-mode))

;; ----------------------------------------------------------------------------
;; Tree-sitter
;; Syntax highlighting
;;
;; Note we need to install some modes to highlight
(use-package tree-sitter
  :init (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs
  :after tree-sitter)

;; ----------------------------------------------------------------------------
;; Languages mode
;;
;; TypeScript, note tree-sitter relies on typescript-mode to highlight code
(use-package typescript-mode
  :after tree-sitter
  :config
  (setq typescript-indent-level 2)
  ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
  ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
  (define-derived-mode typescriptreact-mode typescript-mode "TypeScript TSX")

  ;; use our derived mode for tsx files
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
  ;; by default, typescript-mode is mapped to the treesitter typescript parser
  ;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))

;; ----------------------------------------------------------------------------
;; flycheck
;; Syntax checking extension. Also use for LSP error reporting
(use-package flycheck
  :init (global-flycheck-mode))

;; ----------------------------------------------------------------------------
;; lsp-mode
;; Client for LSP
(use-package lsp-mode
	:config
	;; do not use icons on terminal
	(if (display-graphic-p)
			(setq lsp-headerline-breadcrumb-icons-enable t)
		(setq lsp-headerline-breadcrumb-icons-enable nil))
	:init
	(setq lsp-keymap-prefix "C-c l")
  :hook (
				 ;; automatically start lsp for given modes
				 (typescript-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; High level UI modules for lsp-mode
;; Some keybindings
;; * lsp-ui-peek-find-definitions - M-.
;; * lsp-ui-peek-find-references  - M-?
(use-package lsp-ui
	:commands lsp-ui-mode
	:config
	;; show doc also when cursor is over (preferred while editing in terminal)
	(setq lsp-ui-doc-show-with-cursor t))
;; Interactive ivy interface to the workspace symbol functionality offered by lsp-mode
;; Some useful commands
;; * lsp-ivy-workspace-symbol
;; * lsp-ivy-global-workspace-symbol
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; Implementation of treeview controls using treemacs
;; Some useful commands
;; * lsp-treemacs-errors-list, to show errors
;; * lsp-treemacs-quick-fix, to fix errors
;; * lsp-treemacs-symbols, to show symbols (classes, attributes, ...)
;; * lsp-treemacs-references/lsp-treemacs-implementations
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ----------------------------------------------------------------------------
;; dap-mode
;; Debugger Adapter Protocol for emacs
;;
;; dap-node setup seems broken due a change on vscode extension so you'll need to install manually
;; * Download extension from https://marketplace.visualstudio.com/items?itemName=ms-vscode.node-debug2
;; * Unzip that into the relevant location, e.g. unzip *.vsix -d ~/.emacs.d/.extension/vscode/ms-vscode.node-debug2
(use-package dap-mode
	:init
	(setq dap-auto-configure-mode t)
	;; add the required languages support
	(require 'dap-node)
	(require 'dap-chrome))

;; ----------------------------------------------------------------------------
;; multiple-cursors
;; Multiline editing.
(use-package multiple-cursors
  :bind
      (:map global-map
      ("C->" . mc/mark-next-like-this)
      ("C-<" . mc/mark-previous-like-this)
			("C-c C-<" . mc/mark-all-like-this)))

;; ----------------------------------------------------------------------------
;; magit
(use-package magit)

;; ----------------------------------------------------------------------------
;; restclient
;; make http request
(use-package restclient
  ;; activate only when file extension is .http
  :config (add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode)))


;; restclient
;; rjsx-mode
;; focus mode
;; evil?
;; minimap
;; yasnippet
;; apheleia (format code)
;; all-the-icons-ivy
;; multiple-cursors

;; ----------------------------------------------------------------------------
;;; init.el ends here
