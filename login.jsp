<%@page contentType="text/html;charset=UTF-8"%><%@taglib prefix="c" uri="jakarta.tags.core"%><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso al Sistema - Inventario Luminaria</title>
    <style>
        /* ===== RESET GLOBAL ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        body {
            font-family: 'Segoe UI', Trebuchet MS, sans-serif;
            background: linear-gradient(135deg, #0a0e27 0%, #1a1a3f 50%, #16213e 100%);
            color: #e0e6ff;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        /* ===== FONDO ANIMADO ===== */
        .login-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
            overflow: hidden;
        }

        .animated-shape {
            position: absolute;
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.25;
            animation: float 15s ease-in-out infinite;
        }

        .shape-1 {
            width: 600px;
            height: 600px;
            background: linear-gradient(135deg, #00d4ff, transparent);
            top: -200px;
            left: -200px;
            box-shadow: 0 0 100px #00d4ff;
            animation-delay: 0s;
        }

        .shape-2 {
            width: 500px;
            height: 500px;
            background: linear-gradient(135deg, #6600ff, transparent);
            top: 30%;
            right: -150px;
            box-shadow: 0 0 80px #6600ff;
            animation-delay: 3s;
        }

        .shape-3 {
            width: 450px;
            height: 450px;
            background: linear-gradient(135deg, #00d4ff, transparent);
            bottom: -100px;
            left: 20%;
            box-shadow: 0 0 90px #00d4ff;
            animation-delay: 6s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            25% { transform: translate(50px, -50px) scale(1.1); }
            50% { transform: translate(-50px, 0) scale(0.9); }
            75% { transform: translate(50px, 50px) scale(1.05); }
        }

        /* Malla de fondo */
        body::before {
            content: '';
            position: fixed;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(0deg, transparent 24%, rgba(0, 212, 255, 0.08) 25%, rgba(0, 212, 255, 0.08) 26%, transparent 27%, transparent 74%, rgba(0, 212, 255, 0.08) 75%, rgba(0, 212, 255, 0.08) 76%, transparent 77%, transparent),
                linear-gradient(90deg, transparent 24%, rgba(0, 212, 255, 0.08) 25%, rgba(0, 212, 255, 0.08) 26%, transparent 27%, transparent 74%, rgba(0, 212, 255, 0.08) 75%, rgba(0, 212, 255, 0.08) 76%, transparent 77%, transparent);
            background-size: 50px 50px;
            z-index: -1;
        }

        /* ===== CONTENEDOR PRINCIPAL ===== */
        .login-container {
            position: relative;
            z-index: 1;
            width: 100%;
            text-align: center;
        }

        .login-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 3rem;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        /* ===== TARJETA DE LOGIN ===== */
        .login-card {
            background: linear-gradient(135deg, rgba(15, 52, 96, 0.95) 0%, rgba(20, 35, 70, 0.9) 100%);
            backdrop-filter: blur(30px);
            border: 2px solid rgba(0, 212, 255, 0.5);
            border-radius: 30px;
            padding: 4.5rem 5rem;
            box-shadow: 
                0 20px 60px rgba(0, 212, 255, 0.4),
                0 0 80px rgba(0, 212, 255, 0.2),
                inset 0 1px 0 rgba(255, 255, 255, 0.15);
            position: relative;
            overflow: hidden;
            animation: slideInCard 1s ease-out;
            width: 100%;
        }

        @keyframes slideInCard {
            from {
                opacity: 0;
                transform: translateY(-80px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.2), transparent 70%);
            animation: orbitGlow 8s linear infinite;
            z-index: 0;
        }

        @keyframes orbitGlow {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* ===== ENCABEZADO LOGIN ===== */
        .login-header {
            position: relative;
            z-index: 1;
            text-align: center;
            margin-bottom: 3.5rem;
            animation: fadeInDown 0.8s ease-out;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo-icon {
            font-size: 5em;
            margin-bottom: 1.5rem;
            display: inline-block;
            animation: pulseLogo 2.5s ease-in-out infinite;
            filter: drop-shadow(0 0 30px rgba(0, 212, 255, 0.7)) drop-shadow(0 0 60px rgba(102, 0, 255, 0.4));
            text-shadow: 0 0 30px rgba(0, 212, 255, 0.9);
        }

        @keyframes pulseLogo {
            0%, 100% {
                transform: scale(1) rotateZ(0deg);
                filter: drop-shadow(0 0 30px rgba(0, 212, 255, 0.7)) drop-shadow(0 0 60px rgba(102, 0, 255, 0.4));
            }
            50% {
                transform: scale(1.2) rotateZ(5deg);
                filter: drop-shadow(0 0 50px rgba(0, 212, 255, 0.95)) drop-shadow(0 0 80px rgba(102, 0, 255, 0.6));
            }
        }

        .login-header h1 {
            font-size: 3.8em;
            background: linear-gradient(90deg, 
                #00ffff 0%, 
                #00d4ff 20%, 
                #00aaff 40%,
                #0088ff 60%,
                #00d4ff 80%,
                #00ffff 100%);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 900;
            letter-spacing: 3px;
            margin-bottom: 1rem;
            animation: gradientShift 4s ease infinite;
            text-shadow: 0 0 40px rgba(0, 212, 255, 0.5);
            filter: drop-shadow(0 10px 20px rgba(0, 212, 255, 0.4));
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-header p {
            color: rgba(224, 230, 255, 0.95);
            font-size: 1.2em;
            font-weight: 300;
            letter-spacing: 2px;
            text-transform: uppercase;
            animation: fadeInUp 0.8s ease-out 0.2s both;
            text-shadow: 0 4px 10px rgba(0, 212, 255, 0.3);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* ===== FORM ===== */
        .login-form {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .form-group {
            animation: slideIn 0.6s ease-out;
            animation-fill-mode: both;
            text-align: left;
        }

        .form-group:nth-child(1) { animation-delay: 0.3s; }
        .form-group:nth-child(2) { animation-delay: 0.4s; }
        .form-group:nth-child(3) { animation-delay: 0.5s; }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-40px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .form-group label {
            display: block;
            color: #00d4ff;
            font-weight: 800;
            margin-bottom: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 0.9em;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            font-size: 1.5em;
            pointer-events: none;
            z-index: 3;
            transition: all 0.4s ease;
            filter: drop-shadow(0 0 5px rgba(0, 212, 255, 0.5));
        }

        .form-group input {
            width: 100%;
            padding: 16px 50px 16px 60px;
            background: linear-gradient(135deg, rgba(15, 35, 75, 0.8) 0%, rgba(20, 40, 80, 0.6) 100%);
            border: 2px solid rgba(0, 212, 255, 0.4);
            border-radius: 14px;
            color: #e0e6ff;
            font-size: 1.05em;
            font-family: 'Segoe UI', sans-serif;
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(20px);
            position: relative;
            z-index: 2;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .form-group input::placeholder {
            color: rgba(224, 230, 255, 0.6);
            font-weight: 300;
        }

        .form-group input:focus {
            outline: none;
            border-color: #00d4ff;
            background: linear-gradient(135deg, rgba(15, 45, 100, 0.95) 0%, rgba(20, 50, 120, 0.9) 100%);
            box-shadow: 
                0 0 30px rgba(0, 212, 255, 0.6),
                inset 0 2px 5px rgba(0, 0, 0, 0.3),
                0 0 0 3px rgba(0, 212, 255, 0.2);
            transform: translateY(-3px);
        }

        .form-group input:focus + .input-icon {
            transform: scale(1.3) rotate(10deg);
            color: #6600ff;
            filter: drop-shadow(0 0 10px rgba(102, 0, 255, 0.9));
        }

        .toggle-password {
            position: absolute;
            right: 16px;
            background: linear-gradient(135deg, rgba(0, 212, 255, 0.2), rgba(102, 0, 255, 0.15));
            border: 1px solid rgba(0, 212, 255, 0.4);
            cursor: pointer;
            font-size: 1.4em;
            z-index: 3;
            transition: all 0.3s ease;
            color: #00d4ff;
            padding: 6px 8px;
            border-radius: 8px;
            height: 40px;
            width: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .toggle-password:hover {
            background: linear-gradient(135deg, rgba(0, 212, 255, 0.3), rgba(102, 0, 255, 0.25));
            border-color: #00d4ff;
            transform: scale(1.15);
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.6);
        }

        /* ===== ALERTA ERROR ===== */
        .alert {
            padding: 1.5rem;
            border-radius: 14px;
            display: flex;
            gap: 1.2rem;
            align-items: flex-start;
            animation: alertBounce 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        @keyframes alertBounce {
            0% {
                opacity: 0;
                transform: scale(0.3) translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .alert-error {
            background: linear-gradient(135deg, rgba(255, 23, 68, 0.2) 0%, rgba(229, 57, 53, 0.15) 100%);
            border: 2px solid rgba(255, 23, 68, 0.7);
            box-shadow: 
                0 8px 30px rgba(255, 23, 68, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.1);
        }

        .alert-icon {
            font-size: 1.8em;
            flex-shrink: 0;
            animation: shakeIcon 0.5s ease;
        }

        @keyframes shakeIcon {
            0%, 100% { transform: rotateZ(0deg); }
            25% { transform: rotateZ(-10deg); }
            75% { transform: rotateZ(10deg); }
        }

        .alert-content strong {
            display: block;
            color: #ff8a8a;
            margin-bottom: 0.4rem;
            font-weight: 800;
            font-size: 1.05em;
        }

        .alert-content p {
            color: #ffb3b3;
            font-size: 0.95em;
            line-height: 1.6;
        }

        /* ===== BOTÓN SUBMIT ===== */
        .btn-login {
            width: 100%;
            padding: 16px 32px;
            background: linear-gradient(90deg, 
                #00ffff 0%, 
                #00d4ff 25%, 
                #0088ff 50%,
                #00d4ff 75%,
                #00ffff 100%);
            background-size: 300% 300%;
            color: white;
            border: 2px solid #00d4ff;
            border-radius: 14px;
            font-weight: 800;
            font-size: 1.1em;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 
                0 15px 40px rgba(0, 212, 255, 0.5),
                0 0 40px rgba(0, 212, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            animation: slideIn 0.6s ease-out 0.6s both;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.5), transparent);
            transition: left 0.8s ease;
            z-index: 1;
        }

        .btn-login:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 
                0 25px 50px rgba(0, 212, 255, 0.6),
                0 0 60px rgba(0, 212, 255, 0.5),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
            animation: gradientShift 2s ease infinite;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:active {
            transform: translateY(-2px) scale(0.98);
        }

        /* ===== FOOTER FORM ===== */
        .login-footer {
            text-align: center;
            padding-top: 1.8rem;
            border-top: 2px solid rgba(0, 212, 255, 0.3);
            animation: slideIn 0.6s ease-out 0.7s both;
        }

        .login-footer p {
            color: rgba(224, 230, 255, 0.85);
            font-size: 0.95em;
            margin-bottom: 0.7rem;
            font-weight: 300;
        }

        .login-footer a {
            color: #00d4ff;
            text-decoration: none;
            font-weight: 700;
            transition: all 0.3s ease;
            position: relative;
            letter-spacing: 0.5px;
        }

        .login-footer a::before {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #00d4ff, #6600ff);
            transition: width 0.4s ease;
        }

        .login-footer a:hover {
            color: #6600ff;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }

        .login-footer a:hover::before {
            width: 100%;
        }

        /* ===== INFO PANEL ===== */
        .info-panel {
            display: flex;
            flex-direction: column;
            gap: 2.5rem;
            animation: slideInDown 1s ease-out 0.2s both;
            width: 100%;
            text-align: center;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(80px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .info-item {
            background: linear-gradient(135deg, rgba(0, 212, 255, 0.15) 0%, rgba(102, 0, 255, 0.1) 100%);
            border: 2px solid rgba(0, 212, 255, 0.45);
            border-radius: 18px;
            padding: 2.5rem 3rem;
            backdrop-filter: blur(15px);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
            position: relative;
            overflow: hidden;
            animation: itemFloat 0.6s ease-out;
            animation-fill-mode: both;
            box-shadow: 0 8px 20px rgba(0, 212, 255, 0.2);
        }

        .info-item:nth-child(1) { animation-delay: 0.8s; }
        .info-item:nth-child(2) { animation-delay: 0.9s; }
        .info-item:nth-child(3) { animation-delay: 1s; }

        @keyframes itemFloat {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .info-item::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.35), transparent 70%);
            opacity: 0;
            transition: opacity 0.4s ease;
            z-index: 0;
        }

        .info-item:hover {
            border-color: #00d4ff;
            background: linear-gradient(135deg, rgba(0, 212, 255, 0.22) 0%, rgba(102, 0, 255, 0.15) 100%);
            box-shadow: 
                0 15px 40px rgba(0, 212, 255, 0.4),
                0 0 30px rgba(102, 0, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.1);
            transform: translateY(-12px) scale(1.05);
        }

        .info-item:hover::before {
            opacity: 1;
        }

        .info-icon {
            font-size: 3.5em;
            margin-bottom: 1.2rem;
            display: block;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
            filter: drop-shadow(0 0 8px rgba(0, 212, 255, 0.5));
        }

        .info-item:hover .info-icon {
            transform: scale(1.3) rotateZ(10deg);
            filter: drop-shadow(0 0 15px rgba(0, 212, 255, 0.8)) drop-shadow(0 0 30px rgba(102, 0, 255, 0.5));
        }

        .info-item h3 {
            color: #00d4ff;
            font-size: 1.6em;
            margin-bottom: 0.8rem;
            font-weight: 800;
            position: relative;
            z-index: 2;
            letter-spacing: 0.5px;
            text-shadow: 0 4px 10px rgba(0, 212, 255, 0.4);
        }

        .info-item p {
            color: rgba(224, 230, 255, 0.9);
            font-size: 1.05em;
            line-height: 1.7;
            position: relative;
            z-index: 2;
            font-weight: 300;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .login-card {
                padding: 2.5rem;
            }

            .login-header h1 {
                font-size: 2.5em;
            }

            .logo-icon {
                font-size: 3.5em;
            }

            .info-panel {
                gap: 1.8rem;
            }

            .info-item {
                padding: 2rem 2.5rem;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 1rem;
            }

            .login-card {
                padding: 1.8rem;
                border-radius: 20px;
            }

            .login-header h1 {
                font-size: 2em;
                letter-spacing: 1.5px;
            }

            .logo-icon {
                font-size: 2.8em;
            }

            .form-group input {
                padding: 14px 40px 14px 50px;
                font-size: 16px;
            }

            .info-item h3 {
                font-size: 1.3em;
            }

            .info-item p {
                font-size: 0.95em;
            }

            .info-item {
                padding: 1.5rem 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Background Animation -->
    <div class="login-background">
        <div class="animated-shape shape-1"></div>
        <div class="animated-shape shape-2"></div>
        <div class="animated-shape shape-3"></div>
    </div>

    <!-- Login Container -->
    <div class="login-container">
        <div class="login-wrapper">
            <!-- Login Card -->
            <div class="login-card">
                <!-- Header -->
                <div class="login-header">
                    <div class="logo-icon">💡</div>
                    <h1>Inventario Luminaria</h1>
                    <p>Sistema de Gestión de Inventario</p>
                </div>

                <!-- Form -->
                <form method="post" action="LoginServlet" class="login-form">
                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-error">
                            <span class="alert-icon">⚠️</span>
                            <div class="alert-content">
                                <strong>Error de Login</strong>
                                <p>${error}</p>
                            </div>
                        </div>
                    </c:if>

                    <!-- Usuario Field -->
                    <div class="form-group">
                        <label for="usuario">Usuario</label>
                        <div class="input-wrapper">
                            <span class="input-icon">👤</span>
                            <input 
                                type="text" 
                                id="usuario" 
                                name="usuario" 
                                placeholder="Ingresa tu usuario"
                                required
                                autocomplete="username">
                        </div>
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <label for="clave">Contraseña</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🔒</span>
                            <input 
                                type="password" 
                                id="clave" 
                                name="clave" 
                                placeholder="Ingresa tu contraseña"
                                required
                                autocomplete="current-password">
                            <button type="button" class="toggle-password" onclick="togglePassword()" title="Mostrar contraseña">👁️</button>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-login">Ingresar al Sistema</button>

                    <!-- Footer -->
                    <div class="login-footer">
                        <p>¿Problemas para acceder?</p>
                        <a href="#">Contacta soporte</a>
                    </div>
                </form>
            </div>

            <!-- Info Panel -->
            <div class="info-panel">
                <div class="info-item">
                    <div class="info-icon">⚡</div>
                    <h3>Rápido y Seguro</h3>
                    <p>Acceso seguro con cifrado de datos</p>
                </div>

                <div class="info-item">
                    <div class="info-icon">📊</div>
                    <h3>Control Total</h3>
                    <p>Gestiona tu inventario en tiempo real</p>
                </div>

                <div class="info-item">
                    <div class="info-icon">🔐</div>
                    <h3>Protegido</h3>
                    <p>Tus datos están completamente protegidos</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('clave');
            const toggleBtn = document.querySelector('.toggle-password');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleBtn.textContent = '🙈';
                toggleBtn.title = 'Ocultar contraseña';
            } else {
                passwordInput.type = 'password';
                toggleBtn.textContent = '👁️';
                toggleBtn.title = 'Mostrar contraseña';
            }
        }

        // Animar los shapes
        document.addEventListener('DOMContentLoaded', function() {
            const shapes = document.querySelectorAll('.animated-shape');
            shapes.forEach((shape, index) => {
                shape.style.animationDelay = (index * 0.2) + 's';
            });
        });
    </script>
</body>
</html>