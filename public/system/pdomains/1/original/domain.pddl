(define (domain Online-Learning) 
(:requirements :typing :adl :fluents)
(:types profile level system course software language - object
		frontend-basic frontend-extended backend-basic backend-extended - course
		
)
(:constants HTML4 HTML5 HAML CSS2 CSS3 SASS DNS HOSTING HTTP RUBY NANOC MYSQL 
			POSTGRESQL RAILS HEROKU JS JQUERY GIT SINATRA WEBSITE WEBAPP - course
			HTML4 CSS2 - frontend-basic
			HTML5 CSS3 HAML SASS DNS HTTP JS JQUERY HOSTING - frontend-extended
			RUBY RAILS MYSQL - backend-basic
			NANOC HEROKU GIT SINATRA POSTGRESQL - backend-extended
			LOW MEDIUM HIGH - level
			WIN MAC LINUX - system
)
(:predicates 
	(theoretical ?p - profile)
	(pragmatic ?p - profile)
	(passed ?c - course)
	(technical-english ?l - level)
	(technical-german ?l - level)
	(operating-system ?s - system)
)

(:functions 
	(publish-website)	
	(structure-content)
	(format-content)
	(publish-webapp)
	(frontend-programming)
	(backend-programming)
	(database)
	(framework)
	(deployment)
	(version-control)
)

(:action html4
	:parameters ()
	:precondition (and (or (technical-english LOW) (technical-english MEDIUM) 
					   (technical-english HIGH)) (= (publish-website) 0) (not (passed HTML4))) 
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (structure-content) 40) (increase (total-time) 4))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (structure-content) 50) (increase (total-time) 5))))
				(passed HTML4)
			)
)	

(:action html4-video
	:parameters ()
	:precondition (and (technical-english HIGH) (= (publish-website) 0) (not (passed HTML4))) 
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (structure-content) 40) (increase (total-time) 0.8))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (structure-content) 50) (increase (total-time) 1))))
				(passed HTML4)
			)
)

(:action html4-de
	:parameters ()
	:precondition (and (technical-german HIGH) (= (publish-website) 0) (not (passed HTML4))) 
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (structure-content) 40) (increase (total-time) 4))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (structure-content) 50) (increase (total-time) 5))))
				(passed HTML4)
			)
)

(:action html5
	:parameters ()
	:precondition (and (>= (structure-content) 40) (not (passed HTML5)))
	:effect (and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (structure-content) 30) (increase (total-time) 3))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (structure-content) 40) (increase (total-time) 4))))
				(passed HTML5)
			)
)

(:action haml
	:parameters ()
	:precondition (and (>= (structure-content) 40) (> (format-content) 0) (not (passed HAML)))
	:effect (and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (structure-content) 5) (increase (total-time) 2))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (structure-content) 10) (increase (total-time) 3))))
				(passed HAML)
			)
)

(:action css2
	:parameters ()
	:precondition (and (>= (structure-content) 40) (not (passed CSS2)))
	:effect (and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (format-content) 40) (increase (total-time) 4))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (format-content) 50) (increase (total-time) 5))))
				(passed CSS2)
			)
)

(:action css3
	:parameters ()
	:precondition (and (>= (structure-content) 70) (>= (format-content) 40) (not (passed CSS3)))
	:effect (and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (format-content) 20) (increase (total-time) 3))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (format-content) 30) (increase (total-time) 4))))
				(passed CSS3)
			)
)

(:action sass
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (format-content) 40) (not (passed SASS)))
	:effect (and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (format-content) 10) (increase (total-time) 2))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (format-content) 20) (increase (total-time) 3))))
				(passed SASS)
			)
)

(:action hosting
	:parameters ()
	:precondition (and (>= (structure-content) 40) (not (passed HOSTING)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (deployment) 20) (increase (total-time) 1))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (deployment) 60) (increase (total-time) 2))))
				(passed HOSTING)
			)
)

(:action dns
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (deployment) 20) (not (passed DNS)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (deployment) 50) (increase (total-time) 2))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (deployment) 20) (increase (total-time) 1.5))))
				(passed DNS)
			)
)

(:action http
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (deployment) 20) (not (passed HTTP)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (deployment) 20) (increase (total-time) 1.5))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (deployment) 10) (increase (total-time) 2))))
				(passed HTTP))
)

(:action website
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (deployment) 40) (not (passed WEBSITE)))
	:effect (and 
				(forall (?c - frontend-basic)
					(when (passed ?c) (increase (publish-website) 25))
				)
				(forall (?c - frontend-extended)
					(when (passed ?c) (increase (publish-website) 5))
				)
				(increase (publish-website) 5)
				(increase (total-time) 3)
				(passed WEBSITE)
			)
)

(:action javascript
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (format-content) 40) (not (passed JS)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (frontend-programming) 40) (increase (total-time) 15))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (frontend-programming) 60) (increase (total-time) 10))))
				(passed JS))		
)

(:action jquery
	:parameters ()
	:precondition (and (>= (structure-content) 40) (>= (format-content) 40) 
					   (>= (frontend-programming) 40) (not (passed JQUERY)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (frontend-programming) 10) (increase (total-time) 15))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (frontend-programming) 40) (increase (total-time) 10))))
				(passed JQUERY))		
)

(:action ruby
	:parameters ()
	:precondition (and (> (publish-website) 0) (not (passed RUBY)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (backend-programming) 40) (increase (total-time) 25))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (backend-programming) 50) (increase (total-time) 20))))
				(passed RUBY))		
)

(:action nanoc
	:parameters ()
	:precondition (and (>= (backend-programming) 40) (not (passed NANOC)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (backend-programming) 3) (increase (total-time) 1))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (backend-programming) 5) (increase (total-time) 2))))
				(passed NANOC))		
)

(:action sinatra
	:parameters ()
	:precondition (and (>= (backend-programming) 40) (not (passed SINATRA)))
	:effect	(and
	 			(forall (?p - profile)
					(when (theoretical ?p) 
						(and (increase (framework) 30) (increase (backend-programming) 5) 
						     (increase (database) 5) (increase (total-time) 30))))
				(forall (?p - profile)
					(when (pragmatic ?p) 
						(and (increase (framework) 40) (increase (backend-programming) 10) 
							 (increase (database) 10) (increase (total-time) 20)))) 
				(passed SINATRA)
			)		
)

(:action rails
	:parameters ()
	:precondition (and (>= (backend-programming) 40) (not (passed RAILS))) 
	:effect	(and
	 			(forall (?p - profile)
					(when (theoretical ?p) 
						(and (increase (framework) 50) (increase (backend-programming) 10) 
							 (increase (database) 5) (increase (total-time) 35))))
				(forall (?p - profile)
					(when (pragmatic ?p) 
						(and (increase (framework) 60) (increase (backend-programming) 20) 
							 (increase (database) 10) (increase (total-time) 40))))				 
				(passed RAILS)
			)		
)

(:action mysql
	:parameters ()
	:precondition (and (= (publish-webapp) 0) (> (backend-programming) 0) (not (passed MYSQL)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (database) 40) (increase (total-time) 8))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (database) 50) (increase (total-time) 15))))
			 	(passed MYSQL)
			)		
)

(:action postgresql
	:parameters ()
	:precondition (and (= (publish-webapp) 0) (> (backend-programming) 0) (not (passed POSTGRESQL)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (database) 40) (increase (total-time) 10))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (database) 50) (increase (total-time) 13))))
			 	(passed POSTGRESQL)
			)		
)

(:action git-win
	:parameters ()
	:precondition (and (operating-system WIN) (> (backend-programming) 0) (not (passed GIT)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (version-control) 80) (increase (total-time) 1))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (version-control) 100) (increase (total-time) 2))))
				(passed GIT)
			)		
)

(:action git-linux
	:parameters ()
	:precondition (and (operating-system LINUX) (> (backend-programming) 0) (not (passed GIT)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (version-control) 80) (increase (total-time) 1))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (version-control) 100) (increase (total-time) 2))))
				(passed GIT)
			)		
)

(:action git-mac
	:parameters ()
	:precondition (and (operating-system MAC) (> (backend-programming) 0) (not (passed GIT)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (version-control) 80) (increase (total-time) 1))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (version-control) 100) (increase (total-time) 2))))
				(passed GIT)
			)		
)

(:action heroku
	:parameters ()
	:precondition (and (>= (version-control) 80) (not (passed HEROKU)))
	:effect	(and 
				(forall (?p - profile) 
					(when (theoretical ?p) (and (increase (deployment) 10) (increase (total-time) 0.5))))
				(forall (?p - profile) 
					(when (pragmatic ?p) (and (increase (deployment) 10) (increase (total-time) 1))))
				(passed HEROKU)
			)		
)

(:action webapp
	:parameters ()
	:precondition (and (>= (publish-website) 50) (>= (version-control) 80) (>= (database) 40)
					   (>= (deployment) 10) (>= (backend-programming) 40) (not (passed WEBAPP)))
	:effect	(and
	 			(forall (?c - frontend-basic)
					(when (passed ?c) (increase (publish-webapp) 1))
				)
				(forall (?c - frontend-extended)
					(when (passed ?c) (increase (publish-webapp) 1))
				)
				(forall (?c - backend-basic)
					(when (passed ?c) (increase (publish-webapp) 20))
				)
				(forall (?c - backend-extended)
					(when (passed ?c) (increase (publish-webapp) 5))
				)
				(increase (publish-webapp) 4)
				(increase (backend-programming) 20) (increase (database) 20) 
				(increase (version-control) 20) (increase (total-time) 30)
				(increase (total-time) 15)
				(passed WEBAPP)
			)		
)


;; NOTE: when condition can not contain fluent and predicate in the same clause.
;; use "forall" to define special scale of skills from courses.

)
