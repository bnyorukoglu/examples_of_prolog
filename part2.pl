flight(edirne,erzurum,5).
flight(erzurum,edirne,5).
flight(erzurum,antalya,2).
flight(antalya,erzurum,2).
flight(antalya,izmir,1).
flight(antalya,diyarbakır,5).
flight(izmir,istanbul,3).
flight(izmir,ankara,6).
flight(izmir,antalya,1).
flight(istanbul,izmir,3).
flight(istanbul,ankara,2).
flight(istanbul,trabzon,3).
flight(ankara,trabzon,6).
flight(ankara,istanbul,2).
flight(ankara,izmir,6).
flight(ankara,diyarbakır,8).
flight(ankara,kars,3).
flight(trabzon,istanbul,3).
flight(trabzon,ankara,6).
flight(diyarbakır,antalya,5).
flight(diyarbakır,ankara,8).
flight(kars,ankara,3).
flight(kars,gaziantep,3).
flight(gaziantep,kars,3).

route(From,To,Cost):-flight(From,To,Cost), not(From=To). 
route(From,To,Cost):-flight(From,A,C1), flight(A,To,C2), Cost is C1+C2,not(From=To). 
route(From,To,Cost):-flight(From,A,C1), flight(A,B,C2), flight(B,To,C3), Cost is C1+C2+C3,not(From=To),not(A=To),not(From=B). 
route(From,To,Cost):-flight(From,A,C1), flight(A,B,C2), flight(B,C,C3),  flight(C,To,C4),Cost is C1+C2+C3+C4,not(From=To),not(A=To),not(To=A),not(From=B),not(B=From),not(A=C),not(C=A),not(B=To),not(To=B),not(From=C),not(C=From). 
route(From,To,Cost):-flight(From,A,C1), flight(A,B,C2), flight(B,C,C3),  flight(C,D,C4),flight(D,To,C5),Cost is C1+C2+C3+C4+C5,not(From=To),not(A=To),not(B=To),not(C=To),not(To=B),not(To=C),not(From=B),not(A=C),not(C=A),not(B=D),not(D=B),not(A=D),not(D=A),not(From=C),not(C=From),not(From=D),not(D=From),not(B=To),not(To=B),not(To=C),not(C=To).
route(From,To,Cost):-flight(From,A,C1), flight(A,B,C2), flight(B,C,C3),  flight(C,D,C4),flight(D,E,C5), flight(E,To,C6),Cost is C1+C2+C3+C4+C5+C6,not(From=To),not(A=To),not(To=A),not(From=B),not(B=To),not(To=B),not(To=C),not(C=To),not(A=C),not(C=A),not(B=D),not(C=E),not(E=C),not(D=B),not(A=D),not(D=A),not(B=E),not(E=B),not(D=To),not(To=D),not(A=E),not(E=A),not(From=C),not(C=From),not(From=D),not(D=From),not(From=E),not(E=From).