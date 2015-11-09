<?php
/* @var $this SiteController */
/* @var $error array */


?>

<h2>Error 
    <?php if ($code === 401) { ?>
                    <h3>No esta autorizado a ver esta pagina</h3>
                    <div class="alert alert-error">
                        <p>Solicite información al administrador indicando su usuario de acceso y el siguiente código: <?php echo CHtml::encode($message); ?></p>    
                    </div>
                    <?php 
                    if(!$booleanResult = Yii::app()->user->isGuest){ 
                    $this->redirect(Yii::app()->user->ui->logoutUrl);}  
                    $this->redirect(Yii::app()->homeUrl.'?r=cruge/ui/login'); //aqui va al login
                 } else { ?>
                    <h2>Error <?php echo $code; ?></h2>

                    <?php if ($code === 404) { ?>
                        <div class="alert alert-error">
                            <h3><?php echo CHtml::encode($message); ?></h3>
                            <p>Lo sentimos la página que busca no existe.</p>    
                        </div>
                        <div class="well">
                        <script>
                            var GOOG_FIXURL_LANG = (navigator.language || '').slice(0,2),GOOG_FIXURL_SITE = location.host;
                        </script>
                        <script src="http://linkhelp.clients.google.com/tbproxy/lh/wm/fixurl.js"></script>
                        </div>
                    <?php } else { ?>
                        <div class="alert alert-error">
                            <?php echo CHtml::encode($message); ?>
                        </div>
                <?php }} ?>
    
    
    
    
    
    
    
    <?php //echo $code; ?></h2>

<!--<div class="error">
<?php //echo CHtml::encode($message); ?>
</div>-->