# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

xps = [
    {
        role: '{"en": "Digital introduction instructor", "ptBR": "Instrutor de introdução digital"}',
        company: '{"en": "Autonomous", "ptBR": "Autônomo"}',
        start: "01-07-2009",
        end: "01-07-2017",
        description: '{"en": "Private classes to digital introduction to eldery people. In these classes I addressed topics like email and social medias usage(Instagram, Facebook, Gmail) and some routine usage habits like to transfer pictures from the smartphone to the PC, pair the smartphone to other devices on the client home and so on", "ptBR": "Aulas particulares de introdução digital a pessoas idosas. Nessas aulas abordei tópicos como uso de e-mail e mídias sociais (Instagram, Facebook, Gmail) e alguns hábitos de uso rotineiro como transferir fotos do smartphone para o PC, emparelhar o smartphone com outros dispositivos na casa do cliente e assim por diante"}'
    },
    {
        role: '{"en": "Vacation internship", "ptBR": "Estágio de férias"}',
        company: 'TCA',
        start: "01-06-2014",
        end: "01-07-2014",
        description: '{"en": "Very first contact professionally with programming. Passed a month working on a application for file sharing between the employees, of the engineering projects, of the company, taking in consideration privileges and access permissions", "ptBR": "Primeiro contato profissional com programação. Passou um mês trabalhando em um aplicativo para compartilhamento de arquivos entre os funcionários, dos projetos de engenharia, da empresa, levando em consideração privilégios e permissões de acesso"}'
    },
    {
        role: '{"en": "Internship", "ptBR": "Estágio"}',
        company: 'GDAX Contact Center',
        start: "01-10-2014",
        end: "01-01-2015",
        description: '{"en": "GDAX is a telemarketing company and the application I worked on was for sales recording by the team who call the clients. For this application iit was used a framework created internally wrote in PHP and using a MySQL database, it was my very first contact with Code versioning using SVN, and some frontend skills", "ptBR": "A GDAX é uma empresa de telemarketing e o aplicativo que trabalhei era para registro de vendas pela equipe que ligava para os clientes. Para esta aplicação foi usado um framework criado internamente escrito em PHP e usando um banco de dados MySQL, foi meu primeiro contato com versionamento de código usando SVN, e algumas habilidades de frontend"}'
    },
    {
        role: '{"en": "Internship", "ptBR": "Estágio"}',
        company: 'Avenue Code',
        start: "01-01-2015",
        end: "01-10-2016",
        description: '{"en": "Worked in ACDC app which was a project to use internally by the company employees to control their worked hours inside. It was my first contact with Ruby on Rails, and PostgresSQL. Also had contact with some frontend basic features like CSS and HTML, and Git for versioning. This project was challenging because so many people in many branches were using it, and had some many issues to solve and implement", "ptBR": "Trabalhei no app ACDC que era um projeto para uso interno dos funcionários da empresa para controle de horas trabalhadas internamente. Foi meu primeiro contato com Ruby on Rails e PostgresSQL. Também tive contato com alguns recursos básicos de frontend como CSS e HTML, e Git para versionamento. Este projeto foi desafiador porque muitas pessoas em muitas filiais o estavam usando e tinham muitos problemas para resolver e implementar"}',
        stack: "ruby_on_rails,postgresql,git,ruby"
    },
    {
        role: 'Android developer',
        company: 'Life Link',
        start: "01-05-2017",
        end: "01-12-2017",
        description: '{"en": "Worked on a Android application wrote in Java, to communicates with a Hardware by Bluetooth 4.0. The application receives the information provided by the hardware and send it to an remote server by an API.", "ptBR": "Trabalhei em um aplicativo Android escrito em Java, para se comunicar com um Hardware por Bluetooth 4.0. O aplicativo recebe as informações fornecidas pelo hardware e as envia a um servidor remoto por meio de uma API."}',
        stack: "android,bluetooth_le,git,java"
    },
    {
        role: 'Android developer',
        company: 'Ioasys',
        start: "01-04-2018",
        end: "01-01-2019",
        description: '{"en": "Most of the time, I worked in an Android application programmed with Java, which uses MVVM, Room database, and HTTP requests using Retrofit library to handle data. Some external libraries to handle animations and RecyclerView was being usage and also RxJava to work with reactive programming. The application is an interface between teachers and the bookstore platform. But also worked in some of smaller projects of the software factory", "ptBR": "Na maior parte do tempo, trabalhei em um aplicativo Android programado com Java, que usa MVVM, banco de dados Room e solicitações HTTP usando a biblioteca Retrofit para lidar com os dados. Algumas bibliotecas externas para lidar com animações e RecyclerView estavam sendo usadas e também RxJava para trabalhar com programação reativa. O aplicativo é uma interface entre os professores e a plataforma da livraria. Mas também trabalhei em alguns dos projetos menores da fábrica de software."}',
        stack: "android,git,java,mvvm,room,retrofit,rxjava,data_biding"
    },
    {
        role: 'Android engineer',
        company: 'Critical Techworks',
        start: "01-05-2019",
        description: '{"en": "Worked in an Android application wrote in Kotlin, to handle Media operations using the MVVM pattern and Git for version control, in this project we consume external services like Spotify API, Apple Car play, also worked with internal storage media data(USB) and tuner external interface. This project is just a part of the platform for the future generation of BMW board computers, so I worked  alongside multiple teams in Portugal, Germany and China", "ptBR": "Trabalhei em um aplicativo Android escrito em Kotlin, para lidar com operações de mídia usando o padrão MVVM e Git para controle de versão, neste projeto consumimos serviços externos como Spotify API, Apple Car play, trabalhei também com dados de mídia de armazenamento interno (USB) e sintonizador interface externa. Este projeto é apenas uma parte da plataforma para a futura geração de computadores de bordo BMW, por isso trabalhei ao lado de várias equipas em Portugal, Alemanha e China"}',
        stack: "android,git,kotlin,mvvm,room,expresso,mockito,coroutines,live_data,media_session"
    }
]

Experience.create(xps)