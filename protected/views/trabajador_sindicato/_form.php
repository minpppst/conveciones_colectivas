<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */
/* @var $form CActiveForm */
?>







<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'trabajador-sindicato-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); 
        //echo "SELECT * from trabajador_sindicato where nomina_sindicato='".$_GET['convencion']."'";exit();
        $resultado_sql= Yii::app()->db->createCommand("SELECT * from trabajador_sindicato where nomina_sindicato='".$_GET['convencion']."'")->queryRow();
        print_r($resultado_sql); 
        
        
        
        ?>
      
      
        <div >
            <table id=22 style="border: 1px solid; width: 50%;">
                <tr style="border: 1px solid; width: 50%;"><td><b>Nombres</b></td>
                    <td style=" border: 1px solid; width: 500px;"><b>Cedula</b></td>
                    <td style="width: 1%;"> trabajadores_amparados_conve_col</td>
                    <td> trabajadores_afiliados_sindicato</td>
                    <td>nomina_general</td>
                    <td>secretario_ejecutivo</td>
                    <td>secretario_tesorero</td>
                    <td>secretario_finanzas</td>
                    <td>secretario_trabajo_reclamos</td>
                    <td>secretario_cultura_deporte</td>
                    <td>secretario_organizacion</td>
                    <td>secretario_actas_correspondencias</td>
                    <td>secretario_salud_laboral</td>
                    <td>secretario_vigilancia_disciplina</td>
                    <td>secretario_otro</td>
                    <td>delegado_sindical</td>
                    
                
                </tr></table>    
            
            
        </div>
        
	<div class="row">
		<?php echo $form->labelEx($model,'nomina_sindicato'); ?>
		<?php echo $form->textField($model,'nomina_sindicato',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'nomina_sindicato'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'trabajador'); ?>
		<?php echo $form->textField($model,'trabajador',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'trabajador'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_general'); ?>
		<?php echo $form->textField($model,'secretario_general'); ?>
		<?php echo $form->error($model,'secretario_general'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_ejecutivo'); ?>
		<?php echo $form->textField($model,'secretario_ejecutivo'); ?>
		<?php echo $form->error($model,'secretario_ejecutivo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_tesorero'); ?>
		<?php echo $form->textField($model,'secretario_tesorero'); ?>
		<?php echo $form->error($model,'secretario_tesorero'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_finanzas'); ?>
		<?php echo $form->textField($model,'secretario_finanzas'); ?>
		<?php echo $form->error($model,'secretario_finanzas'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_trabajo_reclamos'); ?>
		<?php echo $form->textField($model,'secretario_trabajo_reclamos'); ?>
		<?php echo $form->error($model,'secretario_trabajo_reclamos'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_cultura_deporte'); ?>
		<?php echo $form->textField($model,'secretario_cultura_deporte'); ?>
		<?php echo $form->error($model,'secretario_cultura_deporte'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_organizacion'); ?>
		<?php echo $form->textField($model,'secretario_organizacion'); ?>
		<?php echo $form->error($model,'secretario_organizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_actas_correspondencias'); ?>
		<?php echo $form->textField($model,'secretario_actas_correspondencias'); ?>
		<?php echo $form->error($model,'secretario_actas_correspondencias'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_salud_laboral'); ?>
		<?php echo $form->textField($model,'secretario_salud_laboral'); ?>
		<?php echo $form->error($model,'secretario_salud_laboral'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_vigilancia_disciplina'); ?>
		<?php echo $form->textField($model,'secretario_vigilancia_disciplina'); ?>
		<?php echo $form->error($model,'secretario_vigilancia_disciplina'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'secretario_otro'); ?>
		<?php echo $form->textField($model,'secretario_otro'); ?>
		<?php echo $form->error($model,'secretario_otro'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'delegado_sindical'); ?>
		<?php echo $form->textField($model,'delegado_sindical'); ?>
		<?php echo $form->error($model,'delegado_sindical'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->