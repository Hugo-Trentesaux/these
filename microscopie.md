# Microscopie optique

Le principe général d'un microscope optique est d'éclairer un échantillon et d'observer la lumière qui rentre dans le système de détection. Sur un échantillon mince, on peut faire de la microscopie en transmission ou en réflexion, mais pour un échantillon biologique épais, la microscopie par fluorescence  est la technique la plus utilisée. En effet, elle permet d'imager une région précise du tissus biologique par diverses techniques de marquage fluorescent tout en contrôlant précisément la région visée par l'éclairage. Dans ce chapitre, j'aborde la technique de microscopie à feuille de lumière à un de deux photons.

## Fluorescence

La microscopie à fluorescence met en jeu le phénomène d’absorption-réémission de lumière par une molécule. La molécule absorbe un photon d'énergie élevée et émet un photon d'énergie moins élevée suite à une relaxation interne.

![fluo](./img/fluo_couleur.svg.png)

> Illustration du phénomène de fluorescence. À gauche point de vue quantique avec les niveaux d'énergie interne, à droite point de vue ondulatoire avec les spectres d’absorption et d'émission

Dans notre cas, la molécule fluorescente est une protéine GCaMP, introduite par modification génétique. Elle absorbe les longueurs d'onde dans le bleu et émet dans le vert. C'est pourquoi nous utilisons on laser à 488 nm pour l'imagerie un photon. De plus, un des avantages de la microscopie à fluorescence est qu'avec un jeu de filtres adapté, on peut obtenir un excellent rapport signal à bruit.  Sur la ligne de détection, on place un filtre coupe bande surnommé "notch" (_encoche_ en anglais) à la longueur d'onde du laser pour couper toute lumière venant de celui-ci. Bien que les enregistrements se déroulent dans le noir, on place aussi un filtre passe bande vert pour atténuer les résidus de luminosité ambiante venant des écrans ou des autres appareils. Ainsi, seule la lumière liée à la fluorescence est détectée.

## Sectionnement optique

Pour réaliser l'imagerie d'un échantillon biologique épais, on peut éclairer l'ensemble de l'échantillon et sélectionner une région d'observation en réglant le système optique de détection. Si le système de détection est un objectif, la région sélectionnée sera un plan dont la largeur est le champ objet de l'objectif et l'épaisseur est sa profondeur de champ. Plus un objet est hors de ce plan, plus il apparaît flou. Or pour un microscope, on travaille avec une courte focale et une grande ouverture numérique, donc la profondeur de champ est très faible. Tout objet présent dans le plan focal de l'objectif est donc imagé avec netteté, mais les objets hors de ce plan (hors focus) génèrent de la lumière parasite qui diminue la rapport signal à bruit. Cette technique ne convient donc pas lors de l'imagerie d'un échantillon dense, et il faut éliminer la lumière émise par les objets hors focus.

Il existe pour cela plusieurs techniques dites de "sectionnement optique". La plus connue, la microscopie confocale, utilise une illumination focalisée en un seul point. L'objet en ce point est fortement éclairé, et le reste beaucoup moins. De plus, un trou conjugué à ce point ne laisse passer que la lumière qui en est issue. L'imagerie d'un plan est ensuite obtenue en scannant ce point dans le plan focal, et l'imagerie d'un volume et répétant l'opération pour plusieurs couches. Cette technique est largement répandue et déclinée, et a l'avantage d'être souple et d'atteindre de bonnes résolutions. Cependant, elle ne peut pas combiner une haute définition (~10e8 voxels) à une fréquence élevée (~1Hz) et doit sacrifier l'un pour l'autre. Elle est donc réservée soit à l'observation détaillée d'échantillons statiques, soit à l'observation peu détaillée d'échantillons dynamiques.

Cette lenteur est liée au fait de scanner un point sur une surface, mais on peut gagner en vitesse en éclairant une ligne d'un coup et en remplaçant le trou par une fente, car il suffit alors de scanner dans une seule dimension. L'éclairage par une ligne peut également se faire par le côté, si l'échantillon s'y prête. De manière analogue, on peut éclairer une couche entière à l'aide d'une feuille de lumière produite par une lentille cylindrique par exemple. Je m'intéresse ici uniquement à la microscopie à nappe laser par balayage (scanning light sheet).

## Nappe laser par balayage

Le volume d'un cerveau de larve de poisson zèbre mesure 400 µm de largeur × 800 µm de longueur × 300 µm de hauteur et est situé sur le dessus de la larve. Afin de minimiser l'épaisseur de tissus traversée, on place donc l'objectif de détection sur la partie supérieure. Le laser peut donc être placé sur le côté. Les yeux sont très pigmentés et la lumière ne passe pas à travers, ce qui crée une zone d'ombre entre les yeux. Certains laboratoires qui sont intéressés par ces régions appartenant au télencéphale et au diencéphale peuvent donc ajouter un deuxième laser à l'avant pour éclairer cette région.

Pour produire un faisceau laser le plus fin possible sur une longueur de 400 µm, il faut minimiser la largeur après 200 µm de propagation avec comme variable le waist w0 placé au milieu de l'échantillon :
$$
w(z) = w_0 \, \sqrt{ 1+ {\left( \frac{z}{z_\mathrm{R}} \right)}^2 } \qquad z_\mathrm{R} = \frac{n \pi w_0^2 }{\lambda}
$$
Un waist trop petit est trop divergeant, et donc trop large sur les bords, mais un waist trop large limite la résolution. Il faut donc donc trouver un optimum. La taille d'un neurone étant de 8 µm environ, des valeurs inférieures sont souhaitables.

![gaussianbeam](./img/gaussianbeamprofilewater.png)

> on voit ici le profil gaussien à 488 nm et à 915 nm dans l'eau pour différentes valeurs du waist. Le trait épais marque la position optimale pour un faisceau de 400 µm de long.

Le waist optimum pour un échantillon de 400 µm est de 5 µm à 488 nm et de 6.5 µm à 915 nm. La largeur du faisceau à 488 nm vaut donc au mieux 5 µm au centre et 7 µm sur les bords du cerveau. À 915 nm c'est 6.5 µm au centre et 9.5 µm sur les bords mais il faut aussi prendre en compte l'effet deux photons. En pratique, la plupart des neurones sont situés entre -150 µm et +150 µm, donc un waist légèrement plus petit est également acceptable.

[TODO objectifs utilisés]

On peut vérifier que cette valeur théorique idéale est bien atteinte en pratique en utilisant des billes fluorescentes pour mesurer le profil du faisceau.

[TODO méthode de mesure par les billes]

![profile](./img/profile_488nm.svg)

> TODO refaire avec la nouvelle cuve + fibre HC + ...
>
> on voit ici la taille réelle du faisceau mesurée à l'aide de billes fluorescentes. La taille du waist est bien de 6 µm, ce qui donne effectivement un faisceau large de 8 µm au bord de l'échantillon

Pour effectuer le balayage, on déplace le faisceau horizontalement. Pour que l'intensité soit homogène sur une image, il faut adopter une vitesse de déplacement constante. Il est alors possible de faire un aller simple ou des allers-retours en nombre entier pendant le temps d'exposition. Pour obtenir une image volumétrique, il suffit de répéter l'opération pour plusieurs couches, en changeant le plan focal de l'objectif de détection et la position vertical de la nappe. Procéder de cette manière couche après couche force à attendre entre deux couches pour laisser le temps aux éléments mécaniques de se positionner, ce qui prend un temps (~10 ms) non négligeable pour des durées d'exposition courtes. Il est également possible de bouger les éléments mécaniques de manière continue en balayant en aller simple. Les couches sont donc légèrement obliques, mais on gagne considérablement en fréquence d'acquisition. Cela est possible grâce au mode "synchronous readout" de la caméra.

Pour un temps d'exposition par couche de 10 ms en mode d'acquisition continu, on peut par exemple réaliser un scan du cerveau à 2,5 Hz en 30 couches espacées de 8µm. Cela permet d'imager la majeure partie du cerveau du poisson. Les couches les plus profondes sont moins nettes car le signal traverse plus de tissus avant d'atteindre l'objectif, et la zone située entre les yeux reste dans l'ombre si on n'utilise qu'un laser. Mais chaque neurone visible est imagé à une fréquence de 2.5 Hz.

## Imagerie deux photons