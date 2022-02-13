# databases_project
Project for the DB Lab 
Project Εργαστηρίου ΒΔ (2019-20)

Εισαγωγή 
Στόχος του project είναι να εξοικειωθείτε με τη σχεδίαση, την υλοποίηση και την εισαγωγή 
δεδομένων σε μια σχεσιακή ΒΔ την οποία θα διασυνδέσετε με διεπαφές (GUIs, Graphical User 
Interfaces) υλοποιημένες σε Java χρησιμοποιώντας την τεχνολογία JDBC. Η ΒΔ αφορά ένα 
ηλεκτρονικό σύστημα υποστήριξης της λειτουργίας ενός Εκδοτικού Οίκου Ημερήσιου Τύπου. 
Στο σύστημα αυτό συνδέονται δημοσιογράφοι που αρθρογραφούν (συντάκτες άρθρων), 
αρχισυντάκτες, διοικητικοί υπάλληλοι και ο εκδότης της κάθε εφημερίδας. 
Σας διατίθεται ένα αρχικό διάγραμμα οντοτήτων σχέσεων της ΒΔ (δείτε το Παράρτημα). Στα 
πλαίσια του project θα πρέπει να μελετήσετε αυτό το διάγραμμα και να το επεκτείνετε με 
νέους πίνακες, γνωρίσματα ή/και συσχετίσεις ώστε η αναθεωρημένη ΒΔ να σας επιτρέψει να 
υλοποιήσετε τα ζητούμενα του Μέρους Α και τη λειτουργικότητα που περιγράφεται στο 
Μέρος Β. Σημειώνεται ότι οι λειτουργικές προδιαγραφές πιθανόν να είναι ημιτελείς ή να 
περιέχουν ασάφειες και ενδεχομένως να χρειαστεί να προχωρήσετε σε κάποιες παραδοχές. 
Οι παραδοχές σας θα πρέπει να είναι ρεαλιστικές και να καταγράφονται με σαφήνεια στην 
αναφορά σας. 
Μέρος Α: ΒΔ και SQL 
Σε πρώτη φάση θα χρειαστεί να μελετήσετε προσεκτικά τον αρχικό σχεδιασμό της ΒΔ που 
δίνεται στο Παράρτημα καθώς και τα ζητούμενα του project τόσο στο Μέρος Α, όσο και στο
B. Με βάση αυτές τις λειτουργικές απαιτήσεις θα πρέπει να αναθεωρήσετε τον αρχικό 
σχεδιασμό. Για παράδειγμα, η ΒΔ θα πρέπει να επεκταθεί ώστε να διατηρεί πληροφορίες για 
τη διαδικασία ελέγχου ενός άρθρου που έχει υποβληθεί στο σύστημα από κάποιο 
δημοσιογράφο. Ο έλεγχος γίνεται από τον αρχισυντάκτη και ανάλογα με την κρίση του θα 
μπορεί: να το εγκρίνει, να το απορρίψει ή να ζητήσει να γίνουν αλλαγές και επανα-υποβολή 
προς έλεγχο. Επίσης θα πρέπει να γίνουν οι απαραίτητες αλλαγές ώστε να υποστηρίζεται η 
διαδικασία καθορισμού των περιεχομένων ενός φύλλου (δηλ. επιλογή των άρθρων που θα 
περιλαμβάνει και ταξινόμησή τους σε σειρά), διαδιακσία που θα γίνεται από τον 
αρχισυντάκτη.
1. (1 μονάδα) Σχεδιάστε το ER διάγραμμα και το αντίστοιχο σχεσιακό διάγραμμα της 
αναθεωρημένης ΒΔ και καταγράψτε τυχόν παραδοχές της σχεδίασής σας 
2. (2 μονάδες) Κατασκευάστε τους πίνακες της ΒΔ συντάσσοντας ένα σύνολο εντολών 
create και insert ώστε να κατασκευαστούν οι απαραίτητες σχέσεις και να γεμίσουν 
με ικανό όγκο δεδομένων που θα επιτρέψει τον έλεγχο της σωστής λειτουργίας της 
ΒΔ και την εκτέλεση των triggers και των stored procedures που ζητούνται στη 
συνέχεια. Θα χρειαστεί να εισάγετε τουλάχιστον 2 εφημερίδες με 2 φύλλα στην 
καθεμία. Όλοι οι πίνακες της ΒΔ θα πρέπει να έχουν τουλάχιστον 2 εγγραφές. 
[2]
3. (3 μονάδες) Κατασκευάστε τα ακόλουθα: 
a. Stored procedure που θα δέχεται σαν είσοδο τον αριθμό φύλλου και το 
όνομα της εφημερίδας και θα εμφανίζει κατάλληλα διαμορφωμένα τα 
στοιχεία των άρθρων του φύλλου με τη σειρά που έχουν τοποθετηθεί. Για 
κάθε άρθρο θα εμφανίζει Τίτλο, Συντάκτη/ες, Ημερομηνία έγκρισης, σελίδα 
που ξεκινάει και συνολική έκταση (πλήθος σελίδων). Σε περίπτωση που το 
φύλλο δεν έχει ‘κλείσει’ (έχει δηλαδή κενό χώρο για επιπλέον άρθρα) θα 
πρέπει να εμφανίζεται σχετικό μήνυμα με τις διαθέσιμες σελίδες. 
b. Stored procedure που θα επαναϋπολογίζει το μισθό ενός εργαζομένου με 
βάση τους μήνες προϋπηρεσίας. Πιο συγκεκριμένα, θα καλείται για 
συγκεκριμένο δημοσιογράφο και θα ελέγχει την ημερομηνία εγγραφής του. 
Θα υπολογίζει τους συνολικούς μήνες προϋπηρεσίας προσθέτοντας στην 
προϋπηρεσία που δηλώθηκε κατά την εγγραφή στο σύστημα τους μήνες που 
έχουν παρέλθει από τότε. Με βάση τους μήνες συνολικής προϋπηρεσίας θα 
υπολογίζει αύξηση βασικού μισθού κατά 0,5% για κάθε μήνα προϋπηρεσίας. 
c. Trigger που θα ενεργοποιείται κατά την εισαγωγή νέου υπαλλήλου και θα 
θέτει το μισθό του στα 650 ευρώ. 
d. Trigger που κατά την εισαγωγή νέας εγγραφής στον πίνακα που συνδέει 
δημοσιογράφο με άρθρο θα ελέγχει αν ο δημοσιογράφος είναι 
αρχισυντάκτης και αν ναι, θα κάνει το άρθρο “accepted”. 
e. Trigger που όταν επιλέγονται άρθρα και εισάγονται σε ένα φύλλο θα ελέγχει 
αν το φύλλο έχει τον απαραίτητο χώρο σε σελίδες. Διαφορετικά θα 
αποτυγχάνει η προσθήκη και θα εμφανίζεται σχετικό μήνυμα λάθους. 
Μέρος Β: GUIs 
Η ΒΔ θα χρειαστεί ένα σύνολο από διεπαφές (interfaces) που θα χρησιμοποιούνται από τις 
διαφορετικές κατηγορίες χρηστών που θα έχουν πρόσβαση σε αυτή. Σημειώνεται ότι η 
υλοποίηση αυτών των διεπαφών μπορεί να απαιτήσει κάποιες αναθεωρήσεις στη σχεδίαση 
(π.χ. να προστεθούν κάποια πεδία σε πίνακες). 
1. (4 μονάδες) Ζητείται να κατασκευάσετε τις 3 διεπαφές που περιγράφονται στη 
συνέχεια σε Java χρησιμοποιώντας IDE της επιλογής σας (Eclipse, NetBeans, κτλ.). 
Επιπλέον, θα πρέπει να κατασκευάσετε μια αρχική σελίδα σύνδεσης όπου κάθε 
χρήστης θα εισάγει username και password. Ανάλογα με την κατηγορία κάθε χρήστη 
θα εμφανίζεται το κατάλληλο από τα παρακάτω GUIs: 
Ο δημοσιογράφος (journalist) θα μπορεί:
− Να υποβάλει ένα νέο άρθρο στην εφημερίδα που εργάζεται. Θα πρέπει να 
εισάγει όλα τα στοιχεία του άρθρου (path αποθήκευσης αρχείου με το 
περιεχόμενο του άρθρου, περίληψη, θεματική κατηγορία/ες στην οποία 
ανήκει, τυχόν επιπλέον συντάκτες, λέξεις κλειδιά, έκταση σε σελίδες, 
συνοδευτικές φωτογραφίες ή εικόνες). 
[3]
− Να βλέπει τα στοιχεία των άρθρων που έχει συγγράψει (είτε μόνος του είτε 
σε συνεργασία με άλλο δημοσιογράφο), καθώς και την κατάσταση των 
άρθρων αναφορικά με τον έλεγχο του αρχισυντάκτη:
o accepted και σε αυτή την περίπτωση θα πρέπει να εμφανίζεται και ο 
αρ. του φύλλου στο οποίο δημοσιεύτηκαν (αν έχουν δημοσιευτεί)
o to_be_revised 
o rejected
− Να υποβάλει μια αναθεωρημένη έκδοση ενός άρθρου του 
Ο αρχισυντάκτης (Editor in chief) θα μπορεί: 
− Να δει όλα τα άρθρα που έχουν εισάγει οι δημοσιογράφοι για την 
εφημερίδα, να τα εγκρίνει ή να ζητά αναθεωρήσεις (υποβάλλοντας σχόλια 
για τις διορθώσεις) ή να τα απορρίπτει.
− Να ορίζει τη σειρά τοποθέτησης των άρθρων στο φύλλο (κάθε άρθρο 
ξεκινάει σε νέα σελίδα και κάθε άρθρο έχει έκταση ακέραιο αριθμό σελίδων)
− Να υποβάλει δικό του άρθρο στην εφημερίδα (σε αυτή την περίπτωση 
θεωρούμε ότι το άρθρο γίνεται αυτόματα accepted). 
− Να εισάγει νέα κατηγορία και να ορίσει τη γονική της εφόσον υπάρχει.
Ο διοικητικός υπάλληλος (administrative) θα μπορεί:
− Να εισάγει στο σύστημα τον αριθμό φύλλων που επιστράφηκαν (δεν 
πωλήθηκαν)
− Να δει συγκεντρωτικά οικονομικά στοιχεία μισθοδοσίας εισάγοντας 
διάστημα σε ακέραιους μήνες (δηλαδή να βλέπει το σύνολο των χρημάτων 
που δαπανήθηκαν σε μισθούς είτε ανά εργαζόμενο είτε συνολικά).
Ο εκδότης (publisher) θα μπορεί:
− να επεξεργάζεται τα στοιχεία της εφημερίδας/ων που του ανήκει
− να καθορίζει τον αριθμό αντιτύπων που θα τυπώνονται για κάθε φύλλο
− να ορίζει τον αρχισυντάκτη στην εφημερίδα/ες
− να δει συγκεντρωτικά στοιχεία πώλησης φύλλων (αντίτυπα που εκδόθηκαν 
μείον φύλλα που επιστράφηκαν ανά φύλλο)
2. (bonus 1 μονάδα) Όπου είναι δυνατό στο GUI να περιοριστεί η εισαγωγή δεδομένων 
από το χρήστη ώστε να αποφεύγονται τα λάθη και να επιταχύνονται οι διαδικασίες 
(π.χ. να γίνεται επιλογή από μενού/λίστες). Οι επιλογές που θα είναι διαθέσιμες θα 
προέρχονται από τα δεδομένα που υπάρχουν στη ΒΔ (π.χ. αν ένας αρχισυντάκτης 
θέλει να επιλέξει τα άρθρα που θα μπουν σε ένα φύλλο θα μπορεί να επιλέξει από τα 
άρθρα που έχουν υποβάλει δημοσιογράφοι της συγκεκριμένης εφημερίδας, τα οποία 
έχει εγκρίνει ο ίδιος και δεν έχουν δημοσιευτεί σε κάποιο προηγούμενο φύλλο), ή αν 
πρόκειται να γίνει μια επεξεργασία, θα εμφανίζονται τα ήδη διαθέσιμα στοιχεία από 
[4]
τη ΒΔ και αν υπάρχουν στοιχεία που δε μπορούν να αλλάξουν να εμφανίζονται σαν 
μη επεξεργάσιμα (‘κλειδωμένα’). 
Οδηγίες παράδοσης 
Το project είναι ομαδικό (2 ατόμων) και βαθμολογικά ισοδυναμεί με το 15% της τελικής 
βαθμολογίας σας στο μάθημα Βάσεις Δεδομένων. Η υποβολή του δεν είναι υποχρεωτική 
αλλά σε περίπτωση που κάποιος φοιτητής δεν το υποβάλει χάνει το συγκεκριμένο 
ποσοστό από τη βαθμολογία του στο μάθημα Βάσεις Δεδομένων.
Προθεσμία Παράδοσης: Κυριακή 9/2/2020, μέσω του eclass. Η προφορική εξέταση θα 
γίνει σε ημερομηνία που θα ανακοινωθεί μετά τη λήξη των υποβολών.
Μπορείτε εναλλακτικά να το παραδώσετε στην εξεταστική Σεπτεμβρίου 2020 (έως και 
31/8/2020) χωρίς κάποια βαθμολογική επίπτωση.
Παραδοτέα: 
− Το σχεσιακό διάγραμμα της τελικής ΒΔ με διευκρινήσεις σχετικά με σχεδιαστικές 
παραδοχές όπου είναι απαραίτητο (σε PDF). 
− Ένα αρχείο .txt ή .sql που θα περιλαμβάνει όλο τον κώδικα της ΒΔ (create και insert 
statements) 
− Ένα αρχείο .txt ή .sql με τα triggers και τα stored procedures που ζητήθηκαν στο Α 
μέρος και όσα ενδεχομένως κατασκευάσατε εσείς για τις ανάγκες του Β μέρους. 
− Τα αρχεία πηγαίου κώδικα των διεπαφών που υλοποιήσατε (GUIs) 
− Μια αναφορά σε PDF που θα περιέχει screenshots από την εκτέλεση (σωστή ή όχι) 
του κώδικά σας στο Β μέρος για όλες τις περιπτώσεις λειτουργικότητας που 
υλοποιήσατε σε καθένα από τα ζητούμενα GUIs. 
− [Εάν το κρίνετε απαραίτητο, μπορείτε να συμπεριλάβετε] ένα αρχείο readme.txt με 
λοιπές οδηγίες αναφορικά με τα παραπάνω. 
Τα αρχεία κάθε μέρους θα πρέπει να συγκεντρωθούν σε αντίστοιχους φακέλους και οι 2 
φάκελοι να συμπιεστούν και να υποβληθούν στο eclass σαν ένα συνολικό αρχείο .RAR ή 
.ZIP της μορφής db_proj_xxxxxxx_xxxxxxx.rar (ή .zip), όπου xxxxxxx το ΑΜ καθενός σας. 
Σημείωση: Όλα τα αρχεία .txt που θα υποβάλετε θα πρέπει να περιέχουν λατινικούς 
χαρακτήρες (άρα γράφετε στα αγγλικά ή σε greeklish). 
Κάθε ομάδα κάνει 1 υποβολή project στο eclass (και όχι 1 για κάθε φοιτητή).
Καλή Επιτυχία :-)
[5]
Παράρτημα: Αρχικο ER Διάγραμμα ΒΔ
Διευκρινήσεις:
- Η συχνότητα έκδοσης μιας Εφημερίδας μπορεί να είναι είτε ημερήσια, είτε 
εβδομαδιαία, είτε μηνιαία
- To πεδίο Καθήκοντα του Διοικητικού Υπαλλήλου είναι είτε "Secretary" είτε "Logistics"
- To path στο Άρθρο περιέχει το μονοπάτι και το όνομα αρχείου που περιέχει το άρθρο
(δηλ. περιέχει δεδομένα της μορφής “C:\Users\Articles\Submitted\Article34a.doc”
- Κάθε Φύλλο έχει συγκεκριμένο πλήθος σελίδων που καθορίζεται από τον 
αρχισυντάκτη. Default τιμή:30
- Η οντότητα Κατηγορία αφορά τη θεματολογία των άρθρων. Ένα πρώτο επίπεδο 
κατηγοριών άρθρων μπορείτε να θεωρήσετε ότι είναι το εξής: Πολιτικά, Οικονομικά, 
Κοινωνικά, Κοσμικά, Αθλητικά. Κάθε μια από τις κατηγορίες αυτές μπορεί να 
αναλύεται περεταίρω: π.χ. Η κατηγορία Πολιτικά μπορεί να διαχωριστεί σε Εσωτερική 
Πολιτική, Εξωτερική Πολιτική και η Εξωτερική Πολιτική σε Ελληνοτουρκικές σχέσεις, 
Μεταναστευτικό, Ευρωπαϊκή Ένωση, κ.ο.κ