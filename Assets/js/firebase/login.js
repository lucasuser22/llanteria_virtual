// Inicializar Firebase
firebase.initializeApp(firebaseConfig);

// Inicializar Firestore
const db = firebase.firestore();

// Función para el inicio de sesión con Google
function iniciarSesionGoogle() {
    const provider = new firebase.auth.GoogleAuthProvider();

    // Configurar la persistencia de la sesión como "none"
    firebase.auth().setPersistence(firebase.auth.Auth.Persistence.NONE)
        .then(() => {
            // Mostrar el popup de inicio de sesión de Google
            return firebase.auth().signInWithPopup(provider);
        })
        .then((result) => {
            // Verificar si el usuario está registrado en la base de datos
            const user = result.user;
            const userEmail = user.email;
            const usersCollection = db.collection('users');
            usersCollection.doc(userEmail).get()
                .then((doc) => {
                    if (doc.exists) {
                        // El usuario está registrado en la base de datos y puede acceder
                        console.log("Usuario registrado:", user);
                        // Redirigir a la página de inicio u otra página
                        window.location.href = "bienvenido.html";
                    } else {
                        // El usuario no está registrado
                        console.error("Usuario no registrado");
                        mostrarMensajeError("Usuario no registrado");
                    }
                })
                .catch((error) => {
                    console.error("Error al verificar usuario:", error);
                    mostrarMensajeError("Error al verificar usuario");
                });
        })
        .catch((error) => {
            // Hubo un error al iniciar sesión
            console.error("Error al iniciar sesión:", error);
            mostrarMensajeError("Error al iniciar sesión");
        });
}

// Función para mostrar un mensaje de error
function mostrarMensajeError(mensaje) {
    // Aquí puedes mostrar el mensaje de error en tu interfaz de usuario
    alert(mensaje);
}
function registrar(){
    window.location.href = "registrar.html";
}

// Escuchar el clic en el botón de inicio de sesión
document.getElementById('btn-login').addEventListener('click', iniciarSesionGoogle);