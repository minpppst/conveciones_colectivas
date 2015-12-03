<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */
/* @var $form CActiveForm */
?>

<?php Yii::app()->clientScript->registerCoreScript('jquery'); ?>
<script type="text/javascript">
/*<![CDATA[*/
jQuery(function($) {
   jQuery('body').delegate('#Clausuras_sub_tipo','change',function(){
    jQuery.ajax({
         'url':'index.php?r=clausuras/cargar_campos&sub_tipo=' + $('#Clausuras_sub_tipo').val(),
         'cache':false,
         'success':function(html){
            jQuery("#vista").html(html)
         }
      });
     
      return false;
   });
   
   jQuery('body').delegate('#Clausuras_tipo_clausura','change',function(){ 
       document.getElementById("Clausuras_sub_tipo").selectedIndex = 0;
       
       valor=$('#Clausuras_sub_tipo').val();
             if(valor==null || valor==""){ 
    jQuery.ajax({
         'url':'index.php?r=clausuras/cargar_campos&sub_tipo=' + $('#Clausuras_sub_tipo').val(),
         'cache':false,
        
         'success':function(html){
            jQuery("#vista").html('')
         }
      });
      
             }
      return false;
   });
   
   
   
   
   
   
});
/*]]>*/
</script>


<?php
    Yii::app()->clientScript->registerScript('helloscript',"
       js:{ valor=$('#Clausuras_sub_tipo').val();
             if(valor!=null || !empty(valor)){
         jQuery.ajax({
         'url':'index.php?r=clausuras/cargar_campos&sub_tipo=' + $('#Clausuras_sub_tipo').val(),
         'cache':false,
         'success':function(html){
          jQuery('#vista').html(html)
         }
      });
            }
            }
    ",CClientScript::POS_READY);
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'clausuras-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Campos con <span class="required">*</span> son Obligatorios.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		
		<?php echo $form->hiddenField($model,'cod_convencion',array('size'=>20,'maxlength'=>20, 'value'=>$_GET['convencion'])); ?>
		<?php echo $form->error($model,'cod_convencion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nro_clausura'); ?>
		<?php echo $form->textField($model,'nro_clausura'); ?>
		<?php echo $form->error($model,'nro_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_clausura'); ?>
		
                    <?php echo $form->dropDownList($model,'tipo_clausura',CHtml::listData(TipoClausura::model()->findAll(array('order' => 'id ASC')), 'id', 'nombre_tipo_clausura'), array(
                    'ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('clausuras/subtipo'),
                    'update' => '#' . CHtml::activeId($model, 'sub_tipo'),
                    'beforeSend' => 'function(){  } ',
                     ), 'prompt' => 'Seleccione un Tipo Clausura...', 
                      )
            );
            ?>
            <?php echo $form->error($model,'tipo_clausura'); ?>
	</div>
        
        
        
        
        
        
	<div class="row">
		<?php echo $form->labelEx($model,'sub_tipo'); ?>
		<?php //si esta creando municipio
                if ($model->tipo_clausura == 0 || $model->tipo_clausura == '') {
                ?>
                    
                <?php 
                      echo $form->dropDownList($model,'sub_tipo',array(),
                       
                        array(
                            
                        'prompt' => 'Seleccione un SubTipo de Clausura...')
                );
                }else{
                $list = SubTipo::model()->findALL(array('condition'=>"id_tipo_clausura=$model->tipo_clausura"));
                
                $niveles=CHtml::listData($list,'id','nombre_sub_tipo_clausura');
                echo $form->dropDownList($model,'sub_tipo',$niveles,
                       
                    array(
                       'prompt' => 'Seleccione un Sub-Tipo de Clausura...')
                );
                    
                    
                }
                
                
                
                ?>
		<?php echo $form->error($model,'sub_tipo'); ?>
	</div>
        
        <div id="vista">
        
        
        
        </div>
        
        
        
        
        
        
        
	<!--<div class="row">
		<?php echo $form->labelEx($model,'id_variable'); ?>
		<?php echo $form->textField($model,'id_variable',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'id_variable'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'valor'); ?>
		<?php echo $form->textField($model,'valor',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'valor'); ?>
	</div>-->

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Cargar' : 'Salvar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->