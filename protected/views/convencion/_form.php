<?php
/* @var $this ConvencionController */
/* @var $model Convencion */
/* @var $form CActiveForm */
?>
<script type="text/javascript">
// Esperar a que se cargue todo el documento
$(document).ready(function(){
        // Al cambiar la opción del SELECT
        $('#ambito').change(function(){
                // Fijarse el valor de la opción seleccionada y activar/desactivar el input
                val = $(this).find('option:selected').val();
                if(val == '2'){
                        // Desactivo el input
                        $('#edicion).attr('required', 'false'); 
                        // READONLY Si no querés que se modifique pero que se envíe el valor al hacer SUBMIT
                        // Sino tendrías que hacer $('#inputcito').attr('disabled', 'disabled'); 
                } else {
                        $('#inputcito').removeAttr('readonly');  // O "disabled"
                }
        });
});
</script>


<?php if(Yii::app()->user->hasFlash('success')):?>
    <div class="grabado_ok">
        <?php echo Yii::app()->user->getFlash('success'); ?>
    </div>
<?php endif; ?>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'convencion-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Los Campos  Con<span class="required">*</span> Son Obligatorios.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
                <?php if($bandera==1){echo $form->hiddenField($model,'id', array('value'=>''));} ?>
		<?php echo $form->labelEx($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'nombre'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'numero_expediente'); ?>
                <?php 
                //si es con antecedente se muestra solo ciertos campos precargados
                if($bandera==1){
                $model->numero_expediente="";
                $model->sector="";
                $model->ambito="";
                $model->fecha_deposito="";
                $model->fecha_inicio="";
                $model->fecha_venc="";
                $model->duracion_meses="";
                $model->fecha_auto_homo="";
                $model->costo_contrato="";
                $model->costo_contrato_sin_prestaciones="";
                    
                }?>
            
                <?php echo $form->textField($model,'numero_expediente',array('size'=>20,'maxlength'=>20, 'placeholder'=>'000-0000-00-00000'));?>
		<?php echo $form->error($model,'numero_expediente'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'inspectoria'); ?>
		
		 <?php echo $form->dropDownList($model,'inspectoria',
                        CHtml::listData(Inspectoria::model()->findAll(array('order'=>'inspectoria ASC', 'select'=>'id, concat(inspectoria, " - ",id) as inspectoria')),'id','inspectoria'),
                        array('prompt' => 'Seleccione una Inspectoria...',
            )
                ); ?>
                    
                    <?php echo $form->error($model,'inspectoria'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sector'); ?>
                <?php echo $form->dropDownList($model,'sector',
                        CHtml::listData(Sector::model()->findAll(array('order'=>'id ASC')),'id','nombre'),
                        array(
                  'prompt' => 'Seleccione un Sector...',
            )
                ); ?>
            
            
            
		<?php echo $form->error($model,'sector'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ambito'); ?>
		 <?php echo $form->dropDownList($model,'ambito',
                        CHtml::listData(Ambito::model()->findAll(array('order'=>'id ASC')),'id','nombre_ambito'),
                        array(
                    'prompt' => 'Seleccione un Ambito...',
            )
                ); ?>
		<?php echo $form->error($model,'ambito'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'edicion'); 
                if($bandera==1){
                    echo $form->textField($model,'edicion', array('value'=>'')); 
                }else { ?>
                <?php echo $form->textField($model,'edicion');} ?>
		<?php echo $form->error($model,'edicion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_deposito'); 
                
                if ($model->fecha_deposito!='') {
                 $model->fecha_deposito=date('d-m-Y',strtotime($model->fecha_deposito));}
                ?>
		<?php 
               
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_deposito',
                'value'=>$model->fecha_deposito,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_deposito,
                'dateFormat'=>'dd-mm-yy',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
              
		<?php echo $form->error($model,'fecha_deposito'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_inicio'); 
                 if ($model->fecha_inicio!='') {
                 $model->fecha_inicio=date('d-m-Y',strtotime($model->fecha_inicio));}
                ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_inicio',
                'value'=>$model->fecha_inicio,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_inicio,
                'dateFormat'=>'dd-mm-yy',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_inicio'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_venc'); 
                if ($model->fecha_venc!='') {
                 $model->fecha_venc=date('d-m-Y',strtotime($model->fecha_venc));}
                
                ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_venc',
                'value'=>$model->fecha_venc,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_venc,
                'dateFormat'=>'dd-mm-yy',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_venc'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'duracion_meses'); ?>
		<?php echo $form->textField($model,'duracion_meses'); ?>
		<?php echo $form->error($model,'duracion_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_auto_homo'); 
                if ($model->fecha_auto_homo!='') {
                 $model->fecha_auto_homo=date('d-m-Y',strtotime($model->fecha_auto_homo));}
                
                ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_auto_homo',
                'value'=>$model->fecha_auto_homo,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_auto_homo,
                'dateFormat'=>'dd-mm-yy',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_auto_homo'); ?>
	</div>

        <div class="row">
		<?php echo $form->labelEx($model,'nro_clausuras'); ?>
		<?php echo $form->textField($model,'nro_clausuras'); ?>
		<?php echo $form->error($model,'nro_clausuras'); ?>
	</div>
        
	<div class="row">
		<?php echo $form->labelEx($model,'costo_contrato'); ?>
		<?php echo $form->textField($model,'costo_contrato',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'costo_contrato'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'costo_contrato_sin_prestaciones'); ?>
		<?php echo $form->textField($model,'costo_contrato_sin_prestaciones',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'costo_contrato_sin_prestaciones'); ?>
	</div>

	<div class="row">
	    
            <?php if ($resultado!=0){ ?>
            <?php echo $form->HiddenField($model,'cod_convencion',array('size'=>11,'maxlength'=>11,'readonly'=>TRUE,  'value'=>$resultado)); }else{?>
            <?php echo $form->HiddenField($model,'cod_convencion',array('size'=>11,'maxlength'=>11,'readonly'=>TRUE,));}?>
	    <?php echo $form->error($model,'cod_convencion'); ?>
	</div>

	

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord  || $bandera==1 ? 'Crear' : 'Salvar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
