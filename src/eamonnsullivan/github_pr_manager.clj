(ns eamonnsullivan.github-pr-manager
  (:require [eamonnsullivan.github-api-lib.pull-requests :as pr]
            [clojure.data.json :as json]))

(def access-token (System/getenv "GITHUB_ACCESS_TOKEN"))

(defn pull-request-info
  [pull-request-url]
  (json/write-str
   (pr/get-pull-request-info access-token
                             pull-request-url)))

(defn add-comment
  [url comment]
  (json/write-str (pr/add-pull-request-comment access-token url comment)))
