<?php
class News_model extends CI_Model {
    public $title;
    public $slug;
    public $text;
    public $posted_date;
    public $user_id;

    public function __construct() {
         // Call the CI_Model constructor
        parent::__construct();
    }

    public function get_article($slug = FALSE) {
        if ($this->db->table_exists('Articles')) {
            if ($slug === FALSE) {
                $query = $this->db->get('Articles');
                return $query->result_array();
            }

            $query = $this->db->get_where('Articles', array('slug' => $slug), 1);
            return $query->row_array();
        }
        else {
            echo show_error('We have encountered some problem. Visit site later.', 500, 'Opps! Something went wrong');
        }
    }

    public function get_some_article($limit = 10, $offset = 0) {
        if ($this->db->table_exists('Articles')) {
            $query = $this->db->get('Articles', $limit, $offset);
            return $query->result_array();
        } else {
            echo show_error('We have encountered a problem !');
        }
    }

    public function post_article() {
        if ($this->db->table_exists('Articles')) {
            $this->title        = $this->input->post('title');
            $this->slug         = url_title($this->title, 'dash', TRUE);
            $this->text         = $this->input->post('text');
            $this->posted_date  = time('Asia/Kathmandu');
            return $this->db->insert('Articles', $this);
        } else {
            echo show_error('We have encountered some problem. Visit site later.', 500, 'Opps! Something went wrong');
        }
    }

    public function update_article() {
        if ($this->db->table_exists('Articles')) {
            $this->title        = $this->input->post('title');
            $this->slug         = url_title($this->title, 'dash', TRUE);
            $this->text         = $this->input->post('text');
            $this->posted_date  = $this->input->post('$posted_date');

            $this->db->update('Articles', $this, array('slug' => $this->input->post('slug')));
        } else {
            echo show_error('We have encountered some problem. Visit site later.', 500, 'Opps! Something went wrong');
        }
    }

    public function total_article() {
        if ($this->db->table_exists('Articles')) {
            return $this->db->count_all('Articles');
        } else {
            echo show_error('We have encountered some problem. Visit site later.', 500, 'Opps! Something went wrong');
        }
    }
}