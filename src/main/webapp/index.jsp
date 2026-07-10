<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RobotFight - L'Arène Ultime</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #0f172a;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --primary: #3b82f6;
            --secondary: #8b5cf6;
            --accent: #ef4444;
            --glass-bg: rgba(30, 41, 59, 0.7);
            --glass-border: rgba(255, 255, 255, 0.1);
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, var(--bg-color), #000000);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        /* Hero Section */
        header {
            text-align: center;
            padding: 4rem 1rem 2rem;
            width: 100%;
        }

        h1 {
            font-size: 4rem;
            font-weight: 800;
            margin: 0;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: fadeInDown 1s ease-out;
        }

        .subtitle {
            font-size: 1.25rem;
            color: var(--text-muted);
            margin-top: 1rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            animation: fadeIn 1.5s ease-out;
            line-height: 1.6;
        }

        /* Container for cards */
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
            max-width: 1200px;
            padding: 2rem;
            width: 100%;
            box-sizing: border-box;
        }

        /* Glassmorphism Card */
        .card {
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            padding: 2.5rem;
            flex: 1 1 400px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
        }

        /* Glowing effect */
        .card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, transparent 60%);
            opacity: 0;
            transition: opacity 0.5s;
            pointer-events: none;
        }

        .card:hover::before {
            opacity: 1;
        }

        h2 {
            font-size: 1.8rem;
            margin-top: 0;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #ffffff;
        }

        .icon {
            font-size: 2.2rem;
        }

        .list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .list li {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            font-size: 1.1rem;
            color: var(--text-muted);
            line-height: 1.5;
        }

        .list li span {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 35px;
            height: 35px;
            min-width: 35px;
            border-radius: 50%;
            background: rgba(59, 130, 246, 0.1);
            color: var(--primary);
            font-weight: bold;
        }

        .upcoming .list li span {
            color: var(--accent);
            background: rgba(239, 68, 68, 0.1);
        }

        b {
            color: #ffffff;
        }

        /* Animations */
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .pulse {
            display: inline-block;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        footer {
            margin-top: auto;
            padding: 2rem;
            color: var(--text-muted);
            font-size: 0.95rem;
            text-align: center;
        }

    </style>
</head>
<body>

    <header>
        <h1>RobotFight</h1>
        <p class="subtitle">L'arène ultime où la technologie affronte l'humanité.<br>Propulsé par un pipeline CI/CD moderne (Jenkins, SonarQube, Tomcat).</p>
    </header>

    <div class="container">
        
        <!-- Fonctionnalités Existantes -->
        <div class="card">
            <h2><span class="icon">✨</span> Déjà implémenté</h2>
            <ul class="list">
                <li><span>✓</span> <div><b>Architecture Robuste</b> : Conception orientée objet avec l'interface unifiée <i>Fighter</i>.</div></li>
                <li><span>✓</span> <div><b>UI Console</b> : Système de barres de vie dynamiques avec couleurs ANSI.</div></li>
                <li><span>✓</span> <div><b>Combats Temps Réel</b> : Simulation de bataille rythmée avec des délais d'attaque.</div></li>
                <li><span>✓</span> <div><b>Aléatoire</b> : Implémentation des probabilités (ex: chance de rater l'attaque pour l'humain).</div></li>
                <li><span>✓</span> <div><b>DevOps Pipeline</b> : Analyse SonarQube et déploiement Tomcat entièrement automatisés.</div></li>
            </ul>
        </div>

        <!-- Fonctionnalités à venir (Stage 3) -->
        <div class="card upcoming">
            <h2><span class="icon pulse">🔥</span> Prochainement (Phase 3)</h2>
            <ul class="list">
                <li><span>⚡</span> <div><b>Dégâts Variables</b> : Fini le tir statique, les attaques infligeront désormais entre 1 et 3 points de dégâts de façon aléatoire.</div></li>
                <li><span>💥</span> <div><b>Coups Critiques</b> : Introduction d'une probabilité d'infliger le double des dégâts lors d'une frappe parfaite.</div></li>
                <li><span>🛡️</span> <div><b>Esquive</b> : Implémentation d'une chance d'annuler complètement l'attaque ennemie grâce à l'agilité du combattant.</div></li>
                <li><span>🤖</span> <div><b>IA Réactive</b> : Le robot pourra prendre des décisions basées sur ses points de vie restants.</div></li>
            </ul>
        </div>

    </div>

    <footer>
        <p>Déployé automatiquement avec ❤️ via Jenkins CI | <b>v1.0-SNAPSHOT</b></p>
    </footer>

</body>
</html>
