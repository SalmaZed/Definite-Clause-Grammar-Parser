
s(X) --> sentence(X).
sentence(s(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
sentence(s(NP,VP,W,Y)) --> noun_phrase(NP), verb_phrase(VP), while_phrase(W), sentence(Y). 

noun_phrase(np(N)) --> noun(N). 
noun_phrase(np(D,N)) --> det(D), noun(N).
noun_phrase(np(D,A,N)) --> det(D), adjective_phrase(A), noun(N). 
noun_phrase(np(A,N)) --> adjective_phrase(A), noun(N).
%whom
noun_phrase(np(N,W)) --> noun(N), whom_pronoun_phrase(W).
noun_phrase(np(D,N,W)) --> det(D), noun(N), whom_pronoun_phrase(W).
noun_phrase(np(D,A,N,W)) --> det(D), adjective_phrase(A), noun(N), whom_pronoun_phrase(W).
noun_phrase(np(A,N,W)) --> adjective_phrase(A), noun(N), whom_pronoun_phrase(W).
%who
noun_phrase(np(N,W)) --> noun(N), who_pronoun_phrase(W).
noun_phrase(np(D,N,W)) --> det(D), noun(N), who_pronoun_phrase(W).
noun_phrase(np(D,A,N,W)) --> det(D), adjective_phrase(A), noun(N), who_pronoun_phrase(W).
noun_phrase(np(A,N,W)) --> adjective_phrase(A), noun(N), who_pronoun_phrase(W). 
%add prepositional phrase
noun_phrase(np(N,PP)) -->noun(N), prepositional_phrase(PP).
noun_phrase(np(D,N,PP)) --> det(D), noun(N), prepositional_phrase(PP).
noun_phrase(np(D,A,N,PP)) --> det(D), adjective_phrase(A), noun(N), prepositional_phrase(PP). 
noun_phrase(np(A,N,PP)) --> adjective_phrase(A), noun(N), prepositional_phrase(PP).

%add conjunction to noun_phrase base cases
noun_phrase(np(N,C,NP)) --> noun(N), conjunction(C), noun_phrase(NP). %John
noun_phrase(np(D,N,C,NP)) --> det(D), noun(N), conjunction(C), noun_phrase(NP). %The boy
noun_phrase(np(D,A,N,C,NP)) --> det(D), adjective_phrase(A), noun(N), conjunction(C), noun_phrase(NP).
noun_phrase(np(A,N,C,NP)) --> adjective_phrase(A), noun(N), conjunction(C), noun_phrase(NP).
%add conjunction to whom
noun_phrase(np(N,W,C,NP)) --> noun(N), whom_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,N,W,C,NP)) --> det(D), noun(N), whom_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,A,N,W,C,NP)) --> det(D), adjective_phrase(A), noun(N), whom_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(A,N,W,C,NP)) --> adjective_phrase(A), noun(N), whom_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
%add conjunction to who
noun_phrase(np(N,W,C,NP)) --> noun(N), who_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,N,W,C,NP)) --> det(D), noun(N), who_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,A,N,W,C,NP)) --> det(D), adjective_phrase(A), noun(N), who_pronoun_phrase(W), conjunction(C), noun_phrase(NP).
noun_phrase(np(A,N,W,C,NP)) --> adjective_phrase(A), noun(N), who_pronoun_phrase(W), conjunction(C), noun_phrase(NP). 
%add conjunction to prep phrases
noun_phrase(np(N,PP,C,NP)) -->noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,N,PP,C,NP)) --> det(D), noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP).
noun_phrase(np(D,A,N,PP,C,NP)) --> det(D), adjective_phrase(A), noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP). 
noun_phrase(np(A,N,PP,C,NP)) --> adjective_phrase(A), noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP). 

verb_phrase(vp(V)) --> verb(V).
verb_phrase(vp(V,NP)) --> verb(V), noun_phrase(NP).
verb_phrase(vp(V,NP1,NP2)) --> verb(V), noun_phrase(NP1), noun_phrase(NP2). 
%add prepositional phrases here
verb_phrase(vp(V,PP)) --> verb(V), prepositional_phrase(PP).
verb_phrase(vp(V,NP,PP)) --> verb(V), noun_phrase(NP), prepositional_phrase(PP).
verb_phrase(vp(V,NP1,NP2,PP)) --> verb(V), noun_phrase(NP1), noun_phrase(NP2), prepositional_phrase(PP). 
%add adverb
verb_phrase(vp(A,VP)) --> adverb_phrase(A), verb_phrase(VP).

%add conjunction to all 3 verb_phrase base cases
verb_phrase(vp(V,C,VP)) --> verb(V), conjunction(C), verb_phrase(VP).
verb_phrase(vp(V,NP,C,VP)) --> verb(V), noun_phrase(NP), conjunction(C), verb_phrase(VP).
verb_phrase(vp(V,NP1,NP2,C,VP)) --> verb(V), noun_phrase(NP1), noun_phrase(NP2), conjunction(C), verb_phrase(VP).
%add conjunction to all 3 verb_phrase with prep phrases
verb_phrase(vp(V,PP,C,VP)) --> verb(V), prepositional_phrase(PP), conjunction(C), verb_phrase(VP).
verb_phrase(vp(V,NP,PP,C,VP)) --> verb(V), noun_phrase(NP), prepositional_phrase(PP), conjunction(C), verb_phrase(VP).
verb_phrase(vp(V,NP1,NP2,PP,C,VP)) --> verb(V), noun_phrase(NP1), noun_phrase(NP2), prepositional_phrase(PP), conjunction(C), verb_phrase(VP).
%add conjunction to all 3 verb_phrase with adverbs
verb_phrase(vp(A,VP1,C,VP2)) --> adverb_phrase(A), verb_phrase(VP1), conjunction(C), verb_phrase(VP2).

adjective_phrase(ap(A)) --> adj(A).
adjective_phrase(ap(A,AP)) --> adj(A), adjective_phrase(AP).

adverb_phrase(adp(A)) --> adverb(A).
adverb_phrase(adp(A,AP)) --> adverb(A), adverb_phrase(AP).

who_pronoun_phrase(who_phr(W,VP)) --> who_pronoun(W), verb_phrase(VP).
whom_pronoun_phrase(whom_phr(W,NP,VP)) --> whom_pronoun(W), noun_phrase(NP), verb_phrase(VP). %whom I liked, whom I gave the flower

prepositional_phrase(pp(P,NP)) --> preposition(P), noun_phrase(NP).
prepositional_phrase(pp(P,NP,PP)) --> preposition(P), noun_phrase(NP), prepositional_phrase(PP). %if this doesnt work, add the prepositional phrase to the noun phrases.

%dictionary

%nouns
noun(n(boy)) --> [boy].
noun(n(girl)) --> [girl].
noun(n(man)) --> [man].
noun(n(woman)) --> [woman].
noun(n(students)) --> [students].
noun(n(professors)) --> [professors].
noun(n(lecturers)) --> [lecturers].
noun(n(scientists)) --> [scientists].
noun(n(researchers)) --> [researchers].
noun(n(box)) --> [box].
noun(n(envelope)) --> [envelope].
noun(n(tree)) --> [tree].
noun(n(room)) --> [room].
noun(n(school)) --> [school].
noun(n(office)) --> [office].
noun(n(hospital)) --> [hospital].
noun(n(shed)) --> [shed].
noun(n(building)) --> [building].
noun(n(they)) --> [they].
noun(n(street)) --> [street].
noun(n(apple)) --> [apple].
noun(n(dog)) --> [dog].
noun(n(cat)) --> [cat].
noun(n(ball)) --> [ball].
noun(n(teachers)) --> [teachers].
noun(n(doctors)) --> [doctors].
noun(n(car)) --> [car].
noun(n(salma)) --> [salma].

%verbs
verb(v(worked)) --> [worked].
verb(v(pushed)) --> [pushed].
verb(v(pulled)) --> [pulled].
verb(v(stored)) --> [stored].
verb(v(put)) --> [put].
verb(v(gave)) --> [gave].
verb(v(took)) --> [took].
verb(v(liked)) --> [liked].
verb(v(hated)) --> [hated].
verb(v(admired)) --> [admired].
verb(v(loved)) --> [loved].
verb(v(appreciated)) --> [appreciated].
verb(v(climbed)) --> [climbed].
verb(v(walked)) --> [walked].
verb(v(ran)) --> [ran].
verb(v(watched)) --> [watched].
verb(v(played)) --> [played].
verb(v(jumped)) --> [jumped].
verb(v(stopped)) --> [stopped].
verb(v(started)) --> [started].
verb(v(ate)) --> [ate].
verb(v(drank)) --> [drank].
verb(v(drew)) --> [drew].
verb(v(painted)) --> [painted].
verb(v(wrote)) --> [wrote].


%determiners
det(d(the)) --> [the].
det(d(this)) --> [this].
det(d(these)) --> [these].
det(d(our)) --> [our].
det(d(my)) --> [my].
det(d(your)) --> [your].
det(d(a)) --> [a].
det(d(an)) --> [an].
det(d(some)) --> [some].
det(d(every)) --> [every].
det(d(many)) --> [many].
det(d(enough)) --> [enough].
det(d(any)) --> [any].

%adjectives
adj(a(young)) --> [young].
adj(a(old)) --> [old].
adj(a(athletic)) --> [athletic].
adj(a(lazy)) --> [lazy].
adj(a(tall)) --> [tall].
adj(a(short)) --> [short].
adj(a(big)) --> [big].
adj(a(large)) --> [large].
adj(a(small)) --> [small].
adj(a(empty)) --> [empty].
adj(a(full)) --> [full].
adj(a(poor)) --> [poor].
adj(a(rich)) --> [rich].
adj(a(white)) --> [white].
adj(a(blue)) --> [blue].
adj(a(black)) --> [black].
adj(a(dark)) --> [dark].
adj(a(friendly)) --> [friendly].
adj(a(intelligent)) --> [intelligent].
adj(a(brilliant)) --> [brilliant].
adj(a(talented)) --> [talented].
adj(a(bright)) --> [bright].
adj(a(scary)) --> [scary].
adj(a(wide)) --> [wide].
adj(a(narrow)) --> [narrow].

%relative pronouns
who_pronoun(pron(who)) --> [who].
whom_pronoun(pron(whom)) --> [whom].

%prepositions
preposition(prep(for)) --> [for].
preposition(prep(in)) --> [in].
preposition(prep(at)) --> [at].
preposition(prep(with)) --> [with].
preposition(prep(without)) --> [without].
preposition(prep(over)) --> [over].
preposition(prep(under)) --> [under].
preposition(prep(below)) --> [below].
preposition(prep(on)) --> [on].
preposition(prep(near)) --> [near].
preposition(prep(before)) --> [before].
preposition(prep(after)) --> [after].
preposition(prep(behind)) --> [behind].
preposition(prep(from)) --> [from].


%conjunction
conjunction(conj(and)) --> [and].

%while
while_phrase(wp(while)) --> [while].

%adverb
adverb(adv(secretly)) --> [secretly].
adverb(adv(quickly)) --> [quickly].
adverb(adv(naturally)) --> [naturally].
adverb(adv(unexpectedly)) --> [unexpectedly].
adverb(adv(urgently)) --> [urgently].
adverb(adv(loudly)) --> [loudly].
adverb(adv(furiously)) --> [furiously].
adverb(adv(gently)) --> [gently].
adverb(adv(safely)) --> [safely].
adverb(adv(slowly)) --> [slowly].
adverb(adv(nicely)) --> [nicely].
adverb(adv(eventually)) --> [eventually].
adverb(adv(exactly)) --> [exactly].
adverb(adv(truthfully)) --> [truthfully].
adverb(adv(reluctantly)) --> [reluctantly].
adverb(adv(repeatedly)) --> [repeatedly].
adverb(adv(happily)) --> [happily].
adverb(adv(steadily)) --> [steadily].
adverb(adv(wholeheartedly)) --> [wholeheartedly].










