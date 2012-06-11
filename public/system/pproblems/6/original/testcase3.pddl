(define (problem Learning-Path)
(:domain Online-Learning)
(:objects
	Caleb - profile
)
(:init
	(= (publish-website) 0)
	(= (publish-webapp) 0)
	(= (structure-content) 0)
	(= (format-content) 0)
	(= (frontend-programming) 0)
	(= (backend-programming) 0)
	(= (database) 0)
	(= (framework) 0)
	(= (deployment) 0)
	(= (version-control) 0)
	(= (total-time) 0)
	(theoretical Caleb)
	(technical-english HIGH)
	(technical-german LOW)
	(operating-system LINUX)
)
(:goal
	(and (>= (publish-website) 90) (>= (publish-webapp) 60) (preference p1 (>= (deployment) 100)))
)

(:metric minimize (is-violated p1))
)