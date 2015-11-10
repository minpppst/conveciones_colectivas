<?php

/**
 * This is the model class for table "trabajador_sindicato".
 *
 * The followings are the available columns in table 'trabajador_sindicato':
 * @property string $id
 * @property string $nomina_sindicato
 * @property string $trabajador
 * @property integer $secretario_general
 * @property integer $trabajadores_amparados_conve_col
 * @property integer $trabajadores_afiliados_sindicato
 * @property integer $secretario_ejecutivo
 * @property integer $secretario_tesorero
 * @property integer $secretario_finanzas
 * @property integer $secretario_trabajo_reclamos
 * @property integer $secretario_cultura_deporte
 * @property integer $secretario_organizacion
 * @property integer $secretario_actas_correspondencias
 * @property integer $secretario_salud_laboral
 * @property integer $secretario_vigilancia_disciplina
 * @property integer $secretario_otro
 * @property integer $delegado_sindical
 *
 * The followings are the available model relations:
 * @property Nomina $trabajador0
 * @property Convencion $nominaSindicato
 */
class Trabajador_sindicato extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Trabajador_sindicato the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'trabajador_sindicato';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nomina_sindicato, trabajador, secretario_general, secretario_ejecutivo, secretario_tesorero, secretario_finanzas, secretario_trabajo_reclamos, secretario_cultura_deporte, secretario_organizacion, secretario_actas_correspondencias, secretario_salud_laboral, secretario_vigilancia_disciplina, secretario_otro, delegado_sindical', 'required'),
			array('secretario_general, secretario_ejecutivo, secretario_tesorero, secretario_finanzas, secretario_trabajo_reclamos, secretario_cultura_deporte, secretario_organizacion, secretario_actas_correspondencias, secretario_salud_laboral, secretario_vigilancia_disciplina, secretario_otro, delegado_sindical', 'numerical', 'integerOnly'=>true),
			array('nomina_sindicato, trabajador', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nomina_sindicato, trabajador, secretario_general, secretario_ejecutivo, secretario_tesorero, secretario_finanzas, secretario_trabajo_reclamos, secretario_cultura_deporte, secretario_organizacion, secretario_actas_correspondencias, secretario_salud_laboral, secretario_vigilancia_disciplina, secretario_otro, delegado_sindical', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'trabajador0' => array(self::BELONGS_TO, 'Nomina', 'trabajador'),
			'nominaSindicato' => array(self::BELONGS_TO, 'Convencion', 'nomina_sindicato'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nomina_sindicato' => 'Nomina Sindicato',
			'trabajador' => 'Trabajador',
                        'trabajadores_amparados_conve_col'=>'Trabajadores Amparados Convencion Colectiva',
                        'trabajadores_afiliados_sindicato'=>'Trabajadores Afiliados Al Sindicato',
			'secretario_general' => 'Secretario General',
			'secretario_ejecutivo' => 'Secretario Ejecutivo',
			'secretario_tesorero' => 'Secretario Tesorero',
			'secretario_finanzas' => 'Secretario Finanzas',
			'secretario_trabajo_reclamos' => 'Secretario Trabajo Reclamos',
			'secretario_cultura_deporte' => 'Secretario Cultura Deporte',
			'secretario_organizacion' => 'Secretario Organizacion',
			'secretario_actas_correspondencias' => 'Secretario Actas Correspondencias',
			'secretario_salud_laboral' => 'Secretario Salud Laboral',
			'secretario_vigilancia_disciplina' => 'Secretario Vigilancia Disciplina',
			'secretario_otro' => 'Secretario Otro',
			'delegado_sindical' => 'Delegado Sindical',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
        
        
        
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('nomina_sindicato',$this->nomina_sindicato,true);
                //$criteria->with = array('nominaSindicato');
                //$criteria->addSearchCondition('nominaSindicato.nombre',$this->nomina_sindicato);
		$criteria->compare('trabajador',$this->trabajador,true);
                $criteria->compare('trabajadores_amparados_conve_col',$this->trabajadores_amparados_conve_col,true);
                $criteria->compare('trabajadores_afiliados_sindicato',$this->trabajadores_afiliados_sindicato);
		$criteria->compare('secretario_general',$this->secretario_general);
		$criteria->compare('secretario_ejecutivo',$this->secretario_ejecutivo);
		$criteria->compare('secretario_tesorero',$this->secretario_tesorero);
		$criteria->compare('secretario_finanzas',$this->secretario_finanzas);
		$criteria->compare('secretario_trabajo_reclamos',$this->secretario_trabajo_reclamos);
		$criteria->compare('secretario_cultura_deporte',$this->secretario_cultura_deporte);
		$criteria->compare('secretario_organizacion',$this->secretario_organizacion);
		$criteria->compare('secretario_actas_correspondencias',$this->secretario_actas_correspondencias);
		$criteria->compare('secretario_salud_laboral',$this->secretario_salud_laboral);
		$criteria->compare('secretario_vigilancia_disciplina',$this->secretario_vigilancia_disciplina);
		$criteria->compare('secretario_otro',$this->secretario_otro);
		$criteria->compare('delegado_sindical',$this->delegado_sindical);
               
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
        
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}