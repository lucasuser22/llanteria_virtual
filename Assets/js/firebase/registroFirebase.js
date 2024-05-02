// Inicializar Firebase
firebase.initializeApp(firebaseConfig);
// Inicializar Firestore
const db = firebase.firestore();

// Obtener referencia al formulario de registro
const registroForm = document.getElementById('formUsuario');

// Manejar el evento de envío del formulario
registroForm.addEventListener('submit', (event) => {
    event.preventDefault(); // Evitar que el formulario se envíe automáticamente

    // Obtener el valor del campo de correo electrónico
    const email = document.getElementById('txtEmail').value;

    // Crear el documento en Firestore con el ID del correo electrónico del usuario
    db.collection('users').doc(email).set({})
        .then(() => {
            console.log("Documento creado en Firestore con el correo electrónico como ID.");
            alert("Cuenta registrada exitosamente.");
            registroForm.reset(); // Reiniciar el formulario después del registro exitoso
        })
        .catch((error) => {
            console.error("Error al registrar la cuenta:", error);
            alert("Error al registrar la cuenta: " + error.message);
        });
});

