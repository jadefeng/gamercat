var jumpycatExtremeGame = function() {
	var game = new Phaser.Game(700, 400, Phaser.AUTO, 'gameDiv');

	var main_state = {
	    preload: function() {
	        this.load.image('cat', '/assets/cat.png');
	        this.load.image('sky', '/assets/sky01.png');
	        this.load.image('brick', '/assets/brick_wall.png');
	        this.load.image('line', '/assets/line.png');
	        this.load.image('health', '/assets/health.png');
	        this.load.image('ground', '/assets/ground.png');
	        this.load.image('star', '/assets/star.png');

	        game.load.audio('hit', '/assets/hit.wav');
	        game.load.audio('pickup', '/assets/pickup.wav');
	    },
	    create: function() {
	        started = 0;
	        points = 0;

	        this.physics.startSystem(Phaser.Physics.ARCADE);

	        this.add.sprite(0, 0, 'sky');

	        hit = this.add.audio('hit');
	        pickup = this.add.audio('pickup');

	        hp = new Array();
	        brick = new Array();
	        
	        player = this.add.sprite(this.world.centerX - 120, this.world.centerY, 'cat');
	        player.anchor.setTo(0.5, 0.5);

	        this.physics.enable(player, Phaser.Physics.ARCADE);
	        player.body.collideWorldBounds = true;

	        stars = game.add.group();
	        stars.enableBody = true;
	        stars.physicsBodyType = Phaser.Physics.ARCADE;
	        
	        bricks = game.add.group();
	        bricks.enableBody = true;
	        bricks.physicsBodyType = Phaser.Physics.ARCADE;
	        
	        bricksdisplay = game.add.group();
	        bricksdisplay.enableBody = true;
	        bricksdisplay.physicsBodyType = Phaser.Physics.ARCADE;
	        
	        stars.setAll('outOfBoundsKill', true);
	        bricks.setAll('outOfBoundsKill', true);
	        bricksdisplay.setAll('outOfBoundsKill', true);

	        i = 0;
	        brickspeed = -225;

	        for (j = 0; j < 3; j++) {
	            hp[j] = this.add.sprite(10 + j * 20, 10, 'health');
	        }
	        j = 2;

	        // ground = this.add.sprite(0, this.world.height - 25, 'ground');
	        // this.physics.enable(ground, Phaser.Physics.ARCADE);
	        // shadow = this.add.sprite(this.world.centerX - 120, this.world.height - 20, 'shadow');
	        // shadow.anchor.setTo(0.5, 0.5);
	        // shadow.scale.setTo(0.2, 0.2);

	        text = game.add.text(game.world.width - 80, 15, "Points: 0", {
	            font: "20px Arial",
	            fill: "#ffffff",
	            align: "center"
	        });
	        text.anchor.setTo(0.5);
	        //
	        text2 = game.add.text(this.world.centerX, this.world.centerY - 25, "Click with your mouse to start!\nYour last score: " + score, {
	            font: "20px Arial",
	            fill: "#ffffff",
	            align: "center"
	        });
	        text2.anchor.setTo(0.5);
	        //

	        // share = this.add.sprite(this.world.centerX, this.world.centerY + 50, 'twitter');
	        // share.anchor.setTo(0.5);
	        // share.inputEnabled = true;
	        // share.events.onInputDown.add(this.shareClicked, this);


	    },
	    shareClicked: function() {
	        sharing = 1;
	        // window.open("https://twitter.com/intent/tweet?url=http://svejkgames.com/game/fighterjet/&text=I+just+made+" + score + "+points+on+FighterJet+Challenge!", "_blank");
	    },
	    update: function() {
	        if (started === 0 && this.input.activePointer.isDown && sharing === 0) {
	            started = 1;
	            player.body.gravity.y = 235;

	            game.time.events.add(Phaser.Timer.SECOND * 1.5, function() {
	                this.time.events.loop(Phaser.Timer.SECOND * 3, this.createStars, this);
	            }, this);
	            this.time.events.loop(Phaser.Timer.SECOND * 3, this.createBricks, this);
	            // share.visible = false;
	            text2.visible = false;
	        }
	        sharing = 0;
	        game.physics.arcade.overlap(player, bricks, this.brickHit, null, this);
	        // game.physics.arcade.overlap(ground, player, this.playerDown, null, this);
	        game.physics.arcade.overlap(stars, player, this.caughtStar, null, this);

	        if (started === 1) {
	            if (this.input.activePointer.isDown) {
	                player.body.velocity.y = -165;
	                player.angle = -3;
	            } else {
	                player.angle = 0;

	            }
	        }
	    },
	    caughtStar: function(a, b) {
	        b.kill();
	        points++;
	        text.setText("Points: " + points);
	        pickup.play();
	    },
	    createBricks: function() {
	    	// Brick 1
	        i++;
	        rnd = this.rnd.integerInRange(-150, 150);
	        brick[i] = bricksdisplay.create(this.world.width + 50, rnd, 'brick');
	        brick[i].anchor.setTo(0.5);
	        brick[i].body.velocity.x = brickspeed;

	        line = bricks.create(this.world.width + 65, rnd, 'line');
	        line.anchor.setTo(0.5);
	        line.body.velocity.x = brickspeed;
	        line.name = i;

	        // Brick 2
	        i++;
	        brick[i] = bricksdisplay.create(this.world.width + 50, rnd + 260 + 100, 'brick');
	        brick[i].anchor.setTo(0.5);
	        brick[i].body.velocity.x = brickspeed;

	        line = bricks.create(this.world.width + 58, rnd + 260 + 100, 'line');
	        line.anchor.setTo(0.5);
	        line.body.velocity.x = brickspeed;
	        line.name = i;

	    },
	    createStars: function() {
	        star = stars.create(this.world.width + 58, rnd = this.rnd.integerInRange(0, this.world.height - 50), 'star');
	        star.anchor.setTo(0.5);
	        star.body.velocity.x = brickspeed;
	    },
	    brickHit: function(a, b) {
	    	console.log("hit a brick");
	        brick[b.name].kill();
	        b.kill();
	        hp[j].kill();
	        j--;
	        hit.play();

	        if (j === -1) {
	            score = points;
	            // Send to database
	            $.ajax({
		        	type: 'POST',
		        	url: '/plays',
		        	data: {
		        		play: {score: score,
		        			   game_id: gameID}
		        	}
		       	 });
	            this.state.start('main');
	        }
	    },
	    playerDown: function(a, b) {
	        hit.play();
	        score = points;
	        game.state.start('main');

	    }
	};

	game.state.add('main', main_state);
	game.state.start('main');  
}