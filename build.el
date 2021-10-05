;;; build.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Shom Bandopadhaya
;;
;; Author: Shom Bandopadhaya <https://github.com/shombando>
;; Maintainer: Shom Bandopadhaya <shom@bandopadhaya.com>
;; Created: October 04, 2021
;; Modified: October 04, 2021
;; Version: 0.0.1
;; Keywords: emacs org hugo
;; Homepage: https://git.sr.ht
;; Package-Requires: ((emacs "27.2"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary: automated build for ox-hugo org mode website
;;
;;  Description
;;
;;; Code:

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install and dependencies
(message "Installing depedencies")
(package-install 'ox-hugo)
(require 'ox-hugo)

(message "Exporting Hugo markdown")

(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./"
             :publishing-function 'org-hugo-export-to-md
             :publishing-directory "./public"
             ;; :with-author nil           ;; Don't include author name
             ;; :with-creator t            ;; Include Emacs and Org versions in footer
             ;; :with-toc t                ;; Include a table of contents
             ;; :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)))    ;; Don't include time stamp in file

;; Generate the site output
(org-publish-all t)

(message "Export complete")

;;; build.el ends here
