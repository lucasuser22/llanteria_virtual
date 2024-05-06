<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Abel OSH">
    <meta name="theme-color" content="#009688">
    <link rel="shortcut icon" href="<?= media();?>/images/favicon.ico">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/style.css">
    <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-firestore.js"></script>
    
    <title><?= $data['page_tag']; ?></title>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1><?= $data['page_title']; ?></h1>
      </div>
      <div class="login-box">
        <div id="divLoading" >
          <div>
            <img src="<?= media(); ?>/images/loading.svg" alt="Loading">
          </div>
        </div>
        <form class="login-form" name="formLogin" id="formLogin" action="">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>INICIAR SESIÓN</h3>
          <div class="form-group">
            <label class="control-label">USUARIO</label>
            <input id="txtEmail" name="txtEmail" class="form-control" type="email" placeholder="Email" autofocus>
          </div>
          
          <div class="form-group">
            <label class="control-label">CONTRASEÑA</label>
            <input id="txtPassword" name="txtPassword" class="form-control" type="password" placeholder="Contraseña">
          </div>

          <button type="button" id="btn-login-google" class="btn btn-danger mx-4">Iniciar sesion con GOOGLE</button>

          <div class="form-group mb-0">
            <div class="utility">
              <p class="semibold-text"><a href="#" data-toggle="flip">¿Olvidaste tu contraseña?</a></p>
            </div>
          </div>
          <div id="alertLogin" class="text-center"></div>
          <div class="form-group btn-container">
            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-sign-in-alt"></i> INICIAR SESIÓN</button>
          </div>
        </form>
        <form id="formRecetPass" name="formRecetPass" class="forget-form" action="">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>¿Olvidaste contraseña?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input id="txtEmailReset" name="txtEmailReset" class="form-control" type="email" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>REINICIAR</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Iniciar sesión</a></p>
          </div>
        </form>
      </div>
    </section>



<script>

 // Configuración de Firebase
 const firebaseConfig = {
		apiKey: "AIzaSyBX35jWyoUxj5s5rqOXpSjeR1ntr3miubc",
		authDomain: "testlogin-3a8cf.firebaseapp.com",
		projectId: "testlogin-3a8cf",
		storageBucket: "testlogin-3a8cf.appspot.com",
		messagingSenderId: "930751800450",
		appId: "1:930751800450:web:ed51fd448da24e9a71c09b",
		measurementId: "G-20YZ81N6JZ"
	  };

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
            // Obtener el correo electrónico del usuario
            const userEmail = result.user.email;

            // Realizar una solicitud al servidor para iniciar sesión utilizando el correo electrónico
            iniciarSesionServidor(userEmail);
        })
        .catch((error) => {
            // Hubo un error al iniciar sesión
            console.error("Error al iniciar sesión:", error);
            mostrarMensajeError("Error al iniciar sesión");
        });
}

// Función para iniciar sesión en el servidor utilizando el correo electrónico proporcionado por Google
function iniciarSesionServidor(correoElectronico) {
    var divLoading = document.querySelector("#divLoading");
    divLoading.style.display = "flex";

    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+'/Login/loginUser'; 
    var formData = new FormData();
    formData.append('email', correoElectronico); // Envía el correo electrónico al servidor

    request.open("POST",ajaxUrl,true);
    request.send(formData);
    request.onreadystatechange = function(){
        if(request.readyState != 4) return;
        if(request.status == 200){
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                window.location.reload(false);
            }else{
                swal("Atención", objData.msg, "error");
            }
        }else{
            swal("Atención","Error en el proceso", "error");
        }
        divLoading.style.display = "none";
    }
}

// Escuchar el clic en el botón de inicio de sesión
document.getElementById('btn-login-google').addEventListener('click', iniciarSesionGoogle);



  </script>




    <script>
        const base_url = "<?= base_url(); ?>";
    </script>
    <!-- Essential javascripts for application to work-->
    <script src="<?= media(); ?>/js/jquery-3.3.1.min.js"></script>
    <script src="<?= media(); ?>/js/popper.min.js"></script>
    <script src="<?= media(); ?>/js/bootstrap.min.js"></script>
    <script src="<?= media(); ?>/js/fontawesome.js"></script>
    <script src="<?= media(); ?>/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<?= media(); ?>/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="<?= media();?>/js/plugins/sweetalert.min.js"></script>
    <script src="<?= media(); ?>/js/<?= $data['page_functions_js']; ?>"></script>
  </body>
</html>